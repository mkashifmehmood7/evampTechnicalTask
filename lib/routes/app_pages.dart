import 'package:evamp_task_app/ui/login/bindings/login_binding.dart';
import 'package:evamp_task_app/ui/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../ui/splash/bindings/splash_binding.dart';
import '../ui/splash/views/splash_view.dart';

part 'app_routes.dart';

GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}


// transition: Transition.fadeIn,
// transitionDuration: Duration(milliseconds : 500),
// curve: Curves.easeIn,