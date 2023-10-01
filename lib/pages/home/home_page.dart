import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/home/home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            children: [
              // info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hutao",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                ],
              ),

              // finance
              renderFinance('Thuê trọ', 2000),
              SizedBox(height: Get.height * 0.02),
              renderFinance('Ăn uống', 3000),
              SizedBox(height: Get.height * 0.02),
              renderFinance('mua sắm', 5000),
            ],
          ),
        ),
      ),
    ));
  }

  Widget renderFinance(TEXT, TOTAL) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.1,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(TEXT,
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
                Text('Còn lại:  ${TOTAL}',
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('Xem lịch sử'))
          ],
        ),
      ),
    );
  }
}
