import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/create/create_controller.dart';
import 'package:manage_personal_finance/pages/dash_board/dash_board_controller.dart';
import 'package:manage_personal_finance/pages/home/home_controller.dart';
import 'package:manage_personal_finance/pages/notification/notification_controller.dart';
import 'package:manage_personal_finance/pages/profile/profile_controller.dart';
import 'package:manage_personal_finance/pages/analytic/analytic_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AnalyticController>(() => AnalyticController());
    Get.lazyPut<CreateController>(() => CreateController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}