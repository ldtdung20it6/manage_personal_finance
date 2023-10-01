import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/dash_board/dash_board_controller.dart';
import 'package:manage_personal_finance/pages/home/home_page.dart';


class DashBoardPage extends GetWidget<DashboardController> {
  var controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomePage(),
                  // SearchPage(),
                  // CreatePage(),
                  // NotificationPage(),
                  // ProfilePage(uid: FirebaseAuth.instance.currentUser!.uid,)
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_outlined),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.plus_square),
                  label: 'create',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'notification',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}