import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/analytic/analytic_controller.dart';

class AnalyticPage extends GetWidget<AnalyticController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('Đoán xem'),),));
  }
}