import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class LoginController extends GetxController{
  Future<void> login(email, password) async {
    try {
      var UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (UserCredential.user?.uid != null) {
        Get.snackbar('Login', 'Success');
        Get.offAndToNamed(AppRoutes.DASHBOARD);
      }else{
        Get.snackbar('Login False', 'Error');
      }
    } catch (e) {
      print(e);
    }
  }
}