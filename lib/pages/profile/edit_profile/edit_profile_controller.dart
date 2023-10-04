import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/profile/profile_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileController extends GetxController {
  var profileController = Get.find<ProfileController>();
  var avatarImageUrl = ''.obs;
  var userId = FirebaseAuth.instance.currentUser!.uid;
  void updateName(name) async {
    final user = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'user_name': name});
  }

  File convertToJpg(File originalImage) {
    final imageBytes = originalImage.readAsBytesSync();
    final image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception('Failed to decode the image.');
    }
    final jpgImage = img.encodeJpg(image, quality: 100);
    return File(originalImage.path.replaceAll(RegExp(r'\..+$'), '.jpg'))
      ..writeAsBytesSync(jpgImage);
  }

  void uploadAndSaveAsJpg(File originalImage) async {
    final jpgImage = convertToJpg(originalImage);
    final imageUrl = await uploadAvatar(jpgImage);
  }

  Future<String?> uploadAvatar(File imageFile) async {
    try {
      final Reference storageReference =
          FirebaseStorage.instance.ref().child('avatars/$userId.jpg');
      final UploadTask uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() => null);
      final String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading avatar: $e');
      return null;
    }
  }

  Future<void> updateAvatarUrl(String imageUrl) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      await usersCollection.doc(userId).update({'avatarUrl': imageUrl});
    } catch (e) {
      print('Error updating avatar URL: $e');
    }
  }
}
