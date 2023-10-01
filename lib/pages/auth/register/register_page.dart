import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/auth/register/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController>{
  var controller = Get.put(RegisterController());
  var USERNAME = 'username';
  var PASSWORD = 'password';
  var username_controller = TextEditingController();
  var password_controller = TextEditingController();

  RegisterPage({super.key});

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
              renderInputRegister(USERNAME),
              SizedBox(height: Get.height * 0.03),
              renderInputRegister(PASSWORD),
              SizedBox(height: Get.height * 0.03),
              renderButtonLogin()
            ]),
          ),
        ]),
      ),
    )));
  }

  Widget renderInputRegister(TYPE) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.08,
      child: TextField(
        controller:
            TYPE == USERNAME ? username_controller : password_controller,
        obscureText: TYPE == USERNAME ? false : true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            )),
            labelText: TYPE == USERNAME ? 'Tên người dùng' : 'Mật khẩu',
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget renderButtonLogin() {
    return GestureDetector(
      onTap: () {
        // controller.register(username_controller.text, password_controller.text);
      },
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.08,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(18)),
        child: const Center(
            child: Text('Đăng Ký',
                style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }

}