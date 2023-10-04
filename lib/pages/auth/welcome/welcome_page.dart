import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/auth/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class WelcomePage extends GetWidget<WelcomeController> {
  var controller = Get.put(WelcomeController());
  var LOGIN = 'login';
  var REGISTER = 'register';
  WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/welcome.jpg'), fit: BoxFit.cover)),
        ),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            renderButton(LOGIN, 'Đăng nhập'),
            SizedBox(height: Get.height * 0.03),
            renderButton(REGISTER, "Đăng ký")
          ]),
        ),
      ]),
    ));
  }

  Widget renderButton(TYPE, TEXT) {
    return GestureDetector(
      onTap: TYPE == LOGIN
          ? () {
              Get.toNamed(AppRoutes.LOGIN);
            }
          : () {
              Get.toNamed(AppRoutes.REGISTER);
            },
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.08,
        decoration: BoxDecoration(
            color: TYPE == LOGIN ? Colors.purple : Colors.blue,
            borderRadius: BorderRadius.circular(18)),
        child: Center(
            child: Text(TEXT,
                style: const TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
}
