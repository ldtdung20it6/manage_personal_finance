import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manage_personal_finance/pages/profile/edit_profile/edit_profile_controller.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class EditProfilePage extends GetWidget<EditProfileController> {
  var controller = Get.put(EditProfileController());
  var EMAIL = 'email';
  var USER_NAME = 'user_name';
  var AVATAR = 'avatar';
  var BACK = 'back';
  var _txtEmailController = TextEditingController();
  var _txtUserNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  inputControllerType(TYPE) {
    if (TYPE == EMAIL) {
      return _txtEmailController;
    } else if (TYPE == USER_NAME) {
      return _txtUserNameController;
    }
  }

  textType(TYPE) {
    if (TYPE == AVATAR) {
      return 'Cập nhật avatar';
    } else if (TYPE == USER_NAME) {
      return 'Cập nhật tên người dùng';
    } else if (TYPE == BACK) {
      return 'Quay lại';
    }
  }

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String newImageUrl = pickedFile.path;
      controller.avatarImageUrl.value = newImageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 25, left: 25, right: 25, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 25, right: 20, left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.bar_chart),
                          onPressed: () {
                            Get.toNamed(AppRoutes.ANALYTIC);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Obx(() {
                          return controller
                                  .profileController.userData.isNotEmpty
                              ? Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(controller
                                              .profileController
                                              .userData['avatarUrl']),
                                          fit: BoxFit.cover)),
                                )
                              : Container();
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: (Get.width - 40) * 0.6,
                          child: Column(
                            children: [
                              Obx(() {
                                return controller
                                        .profileController.userData.isNotEmpty
                                    ? Text(
                                        '${controller.profileController.userData['user_name']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff565c95)),
                                      )
                                    : Container();
                              }),
                              const SizedBox(height: 10),
                              Text(
                                '${controller.profileController.userData['email']}',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                renderInputType(controller.profileController.userData['email']),
                renderListFuncMenu(AVATAR),
                renderListFuncMenu(USER_NAME),
                renderListFuncMenu(BACK)
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget renderListFuncMenu(TYPE) {
    return GestureDetector(
      onTap: () {
        if (TYPE == USER_NAME) {
          Get.dialog(
            showModal(TYPE),
            barrierDismissible: true,
          );
        } else if (TYPE == AVATAR) {
          Get.dialog(
            showModal(TYPE),
            barrierDismissible: true,
          );
        } else if (TYPE == BACK) {
          Get.back();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
        width: Get.width,
        height: Get.height * 0.08,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.03),
                spreadRadius: 10,
                blurRadius: 3,
              ),
            ]),
        child: Center(
            child: Text(textType(TYPE),
                style:
                    const TextStyle(color: Color(0xff565c95), fontSize: 18))),
      ),
    );
  }

  Widget renderInputType(email) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
      width: Get.width,
      height: Get.height * 0.08,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.03),
              spreadRadius: 10,
              blurRadius: 3,
            ),
          ]),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('Email: ${email}'))),
    );
  }

  Widget showModal(TYPE) {
    return AlertDialog(
      title:
          Text(TYPE == USER_NAME ? 'Tên người dùng' : 'Thay đổi ảnh đại diện'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (TYPE == USER_NAME)
              TextField(
                controller: _txtUserNameController,
                decoration: const InputDecoration(
                  labelText: 'Nhập tên mới của bạn',
                ),
              )
            else
              ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: const Text('Chọn ảnh từ thư viện'),
              ),
            Obx(() {
              final avatarImageUrl = controller.avatarImageUrl.value;
              return avatarImageUrl.isNotEmpty
                  ? Image.file(File(avatarImageUrl))
                  : SizedBox.shrink();
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (TYPE == AVATAR) {
                      var avatarImageFile =
                          File(controller.avatarImageUrl.value);
                      if (avatarImageFile.existsSync()) {
                        var imageUrl =
                            await controller.uploadAvatar(avatarImageFile);
                        if (imageUrl != null) {
                          await controller.updateAvatarUrl(imageUrl);
                        }
                      }
                    } else if (TYPE == USER_NAME) {
                      controller.updateName(_txtUserNameController.text);
                      Get.back();
                    }
                  },
                  child: const Text('Lưu lại'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Quay lại'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
