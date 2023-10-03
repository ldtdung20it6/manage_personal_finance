import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  RxList<Map<String, dynamic>> expenses = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchExpenses();
  }

  Future<void> save(icon, name,description, price) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('finance')
          .add({
        'icon': icon,
        'name': name,
        'description':description,
        'price': price,
      });
      print('Thêm dữ liệu thành công');
      await fetchExpenses();
    } catch (e) {
      print('Lỗi khi thêm dữ liệu: $e');
    }
  }

  Future<void> fetchExpenses() async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('finance')
          .get();

      expenses.assignAll(
          querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
    } catch (e) {
      print('Lỗi khi lấy dữ liệu: $e');
    }
  }
}
