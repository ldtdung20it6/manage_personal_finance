import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/auth/register/register_provider.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class RegisterController extends GetxController {
  void register(user_name,email,password,repeatPassword) {
    if (password == repeatPassword) {
      RegisterProvider().register(user_name,email, password).then((user) {
        if (user != null) {
          Get.snackbar('Đăng ký thành công', 'Success');
          Get.offAllNamed(AppRoutes.DASHBOARD);
        } else {
          Get.snackbar('Đăng ký thất bại', 'Error');
        }
      });
    } else {
      Get.snackbar('Mật khẩu không khớp', 'Error');
    }
  }
}
