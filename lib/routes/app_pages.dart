import 'package:evamp_task_app/ui/login/bindings/login_binding.dart';
import 'package:evamp_task_app/ui/login/views/login_view.dart';
import 'package:evamp_task_app/ui/products/views/products_view.dart';
import 'package:evamp_task_app/ui/profile/bindings/profile_binding.dart';
import 'package:evamp_task_app/ui/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../ui/products/bindings/products_binding.dart';
import '../ui/splash/bindings/splash_binding.dart';
import '../ui/splash/views/splash_view.dart';

part 'app_routes.dart';


class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.splash;

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
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: _Paths.products,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    ),
  ];
}
