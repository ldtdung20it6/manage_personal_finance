import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class SplashController extends GetxController{
  late Rx<User?> _user;
  var firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.WELCOME);
    } else {
      Get.offAndToNamed(AppRoutes.DASHBOARD);
    }
  }
}