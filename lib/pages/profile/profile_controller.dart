import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userData = {}.obs;
  var userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void onInit() {
    super.onInit();
    loadUserData(userId);
  }
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        return userData;
      } else {
        print('Không tìm thấy người dùng');
        return null;
      }
    } catch (e) {
      print('Lỗi khi lấy thông tin người dùng: $e');
      return null;
    }
  }
  Future<void> loadUserData(String userId) async {
    try {
      var data = await getUserData(userId);
      if (data != null) {
        userData.value = data;
      } else {
        print('Không tìm thấy người dùng');
      }
    } catch (e) {
      print('Lỗi khi lấy thông tin người dùng: $e');
    }
  }


  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}
