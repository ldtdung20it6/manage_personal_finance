import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/auth/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends GetWidget<LoginController> {
  var controller = Get.put(LoginController());
  var EMAIL = 'email';
  var PASSWORD = 'password';
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        height: Get.height,
        child: Stack(children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/welcome.jpg'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              renderInputLogin(EMAIL),
              SizedBox(height: Get.height * 0.03),
              renderInputLogin(PASSWORD),
              SizedBox(height: Get.height * 0.03),
              renderButtonLogin()
            ]),
          ),
        ]),
      ),
    )));
  }

  Widget renderInputLogin(TYPE) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.08,
      child: TextField(
        controller:
            TYPE == EMAIL ? email_controller : password_controller,
        obscureText: TYPE == EMAIL ? false : true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            )),
            labelText: TYPE == EMAIL ? 'Nhập Email' : 'Mật khẩu',
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget renderButtonLogin() {
    return GestureDetector(
      onTap: () {
        controller.login(email_controller.text, password_controller.text);
      },
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.08,
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(18)),
        child: const Center(
            child: Text('Đăng nhập',
                style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}
