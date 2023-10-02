import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterProvider {
  Future<User?> register(user_name,email,  password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'userId':userCredential.user!.uid,
          'user_name':user_name,
          'email': email,
        });
      }
      return userCredential.user;
    } catch (e) {
      print('Đăng ký thất bại: $e');
      return null;
    }
  }
}