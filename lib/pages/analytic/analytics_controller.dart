import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  RxList<Map<String, dynamic>> financeData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFinanceData();
  }

  Future<void> fetchFinanceData() async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('finance')
          .get();

      financeData.assignAll(
          querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
    } catch (e) {
      print('Error fetching finance data: $e');
    }
  }
}
