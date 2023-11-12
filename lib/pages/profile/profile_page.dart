import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/profile/profile_controller.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class ProfilePage extends GetWidget<ProfileController> {
  var controller = Get.put(ProfileController());
  var INFO = 'info';
  var SINGOUT = 'singout';
  var ABOUT_APP = 'about_app';
  var EXPENSE_MANAGEMENT = 'expense_management';
  var ANALYTIC = 'analytic';

  textType(TYPE) {
    if (TYPE == INFO) {
      return 'Thông tin cá nhân';
    } else if (TYPE == ANALYTIC) {
      return 'Phân tích chi tiêu';
    } else if (TYPE == EXPENSE_MANAGEMENT) {
      return 'Quản lý chi tiêu';
    } else if (TYPE == ABOUT_APP) {
      return 'Thông tin về ứng dụng';
    } else if (TYPE == SINGOUT) {
      return 'Đăng xuất';
    }
  }

  buttonType(TYPE) {
    if (TYPE == INFO) {
      return Get.toNamed(AppRoutes.EDIT_PROFILE);
    } else if (TYPE == EXPENSE_MANAGEMENT) {
      return controller;
    } else if (TYPE == ANALYTIC) {
      return Get.toNamed(AppRoutes.ANALYTIC);
    } else if (TYPE == ABOUT_APP) {
      return controller;
    } else if (TYPE == SINGOUT) {
      return controller.signOut();
    }
  }

  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
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
                        return controller.userData.isNotEmpty
                            ? Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            controller.userData['avatarUrl']),
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
                              return controller.userData.isNotEmpty
                                  ? Text(
                                      '${controller.userData['user_name']}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff565c95)),
                                    )
                                  : Container();
                            }),
                            const SizedBox(height: 10),
                            Text(
                              '${controller.userData['email']}',
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
              renderListFuncMenu(INFO),
              renderListFuncMenu(EXPENSE_MANAGEMENT),
              renderListFuncMenu(ANALYTIC),
              renderListFuncMenu(ABOUT_APP),
              renderListFuncMenu(SINGOUT),
            ],
          )
        ],
      ),
    ));
  }

  Widget renderListFuncMenu(TYPE) {
    return GestureDetector(
      onTap: () {
        buttonType(TYPE);
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
}
