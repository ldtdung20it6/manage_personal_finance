import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/profile/profile_controller.dart';

class ProfilePage extends GetWidget<ProfileController> {
  var controller = Get.put(ProfileController());
  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(() {
        return controller.userData.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tên người dùng: ${controller.userData['user_name']}'),
                  Text('Email: ${controller.userData['email']}'),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    ));
  }
}
