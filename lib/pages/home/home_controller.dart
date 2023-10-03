import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/create/create_controller.dart';
import 'package:manage_personal_finance/pages/profile/profile_controller.dart';

class HomeController extends GetxController {
  var putcreateController = Get.put(CreateController());
  var createController = Get.find<CreateController>();
  var putProfileController = Get.put(ProfileController());
  var profileController = Get.find<ProfileController>();
}
