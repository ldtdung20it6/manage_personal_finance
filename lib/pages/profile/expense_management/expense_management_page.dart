import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:manage_personal_finance/pages/profile/expense_management/expense_management_controller.dart';
import 'package:manage_personal_finance/routes/app_routes.dart';

class expenseManagementPage extends GetWidget<expenseManagementController> {
  var controller = Get.put(expenseManagementController());
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text("Tổng quan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff565c95),
                                  )),
                              IconBadge(
                                icon: const Icon(Icons.notifications_none),
                                itemColor: const Color(0xff565c95),
                                hideZero: true,
                                top: -1,
                                onTap: () {
                                  Get.toNamed(AppRoutes.ANALYTIC);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      Text('${now.day}/${now.month}/${now.year}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xff565c95),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Obx(() {
                  if (controller.createController.expenses.isEmpty) {
                    return const Center(
                      child: Text('Không có khoản chi tiêu nào.'),
                    );
                  }
                  return renderFinance(controller.createController.expenses);
                }),
              ],
            ),
          )
              ],
            ),
          ),
        ),
      ),
    );
  }
Widget renderFinance(List<Map<String, dynamic>> expenses) {
  return GestureDetector(
    onTap: () {
      print('click');
    },
    child: Column(
      children: expenses.map((expense) {
        var iconCode = expense['icon'];
        var name = expense['name'];
        var description = expense['description'];
        var price = expense['price'];
  
        return Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.03),
                spreadRadius: 10,
                blurRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 20,
              left: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffe4e9f7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(Icons.home),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    width: (Get.width - 90) * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                        
                      }, icon: const Icon(Icons.delete)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}
}
