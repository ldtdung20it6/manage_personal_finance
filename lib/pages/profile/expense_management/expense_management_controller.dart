import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/create/create_controller.dart';
import 'package:manage_personal_finance/pages/profile/profile_controller.dart';

class expenseManagementController extends GetxController {
  var putcreateController = Get.put(CreateController());
  var createController = Get.find<CreateController>();
  var putProfileController = Get.put(ProfileController());
  var profileController = Get.find<ProfileController>();

  RxList<Map<String, dynamic>> expenses = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  void onDeleteExpense(Map<String, dynamic> expense) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      print('Deleting expense: $expense');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('finance')
          .doc(expense['id'])
          .delete();

      createController.expenses.remove(expense);
      createController.update();

      print('Expense deleted successfully!');
    } catch (e) {
      print('Error deleting expense: $e');
    }
  }
}
