import 'package:get/get.dart';
import 'package:manage_personal_finance/pages/auth/login/login_page.dart';
import 'package:manage_personal_finance/pages/auth/register/register_page.dart';
import 'package:manage_personal_finance/pages/auth/welcome/welcome_page.dart';
import 'package:manage_personal_finance/pages/dash_board/dash_board_binding.dart';
import 'package:manage_personal_finance/pages/dash_board/dash_board_page.dart';
import 'package:manage_personal_finance/pages/dash_board/splash/splash_page.dart';
import 'package:manage_personal_finance/pages/home/home_page.dart';
import 'package:manage_personal_finance/pages/profile/edit_profile/edit_profile_page.dart';

import 'app_routes.dart';

class AppPages{
  static var list = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashView()),
    GetPage(name: AppRoutes.WELCOME, page: () => WelcomePage()),
    GetPage(name: AppRoutes.DASHBOARD, page: () => DashBoardPage(),binding: DashboardBinding()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.REGISTER, page: () => RegisterPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.EDIT_PROFILE, page: () => EditProfilePage()),
  ];
}