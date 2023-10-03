import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/notification/notification_controller.dart';

class NotificationPage extends GetWidget<NotificationController>{
  var controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('Đoán xem'),),));
  }
}