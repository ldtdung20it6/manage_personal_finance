import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/transaction_history/transaction_history_controller.dart';

class TransactionHistoryPage extends GetWidget<TransactionHistoryController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: Text('Đoán xem'),),));
  }
}