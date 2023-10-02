import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/auth/register/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  var controller = Get.put(RegisterController());
  var USERNAME = 'username';
  var EMAIL = 'email';
  var PASSWORD = 'password';
  var REPEART_PASSWORD = 'repeart_password';
  var username_controller = TextEditingController();
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var repeart_password_controller = TextEditingController();

  inputController(TYPE) {
    if (TYPE == USERNAME) {
      return username_controller;
    } else if (TYPE == PASSWORD) {
      return password_controller;
    } else if (TYPE == REPEART_PASSWORD) {
      return repeart_password_controller;
    } else if (TYPE == EMAIL) {
      return email_controller;
    }
  }

  inputLabelText(TYPE) {
    if (TYPE == USERNAME) {
      return 'Tên người dùng';
    } else if (TYPE == PASSWORD) {
      return 'Mật khẩu';
    } else if (TYPE == REPEART_PASSWORD) {
      return 'Nhập lại Mật khẩu';
    } else if (TYPE == EMAIL) {
      return 'Nhập Email';
    }
  }

  hiddenPassword(TYPE) {
    if (TYPE == PASSWORD) {
      return true;
    } else if (TYPE == REPEART_PASSWORD) {
      return true;
    } else {
      return false;
    }
  }

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
              renderInputRegister(EMAIL),
              SizedBox(height: Get.height * 0.03),
              renderInputRegister(PASSWORD),
              SizedBox(height: Get.height * 0.03),
              renderInputRegister(REPEART_PASSWORD),
              renderButtonRegister()
            ]),
          ),
        ]),
      ),
    )));
  }

  Widget renderInputRegister(TYPE) {
    return SizedBox(
      width: Get.width * 0.9,
      height: Get.height * 0.08,
      child: TextField(
        controller: inputController(TYPE),
        obscureText: hiddenPassword(TYPE),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            )),
            labelText: inputLabelText(TYPE),
            labelStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget renderButtonRegister() {
    return GestureDetector(
      onTap: () {
        controller.register(username_controller.text,email_controller.text, password_controller.text,
            repeart_password_controller.text);
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
