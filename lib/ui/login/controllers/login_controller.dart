import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../network/mock_system_api_service.dart';
import '../../../preferences.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  RxBool isLoading = false.obs;

  String? onEmailValidator(String? value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!(regex.hasMatch(value!))) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  String? onPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter you password";
    } else {
      return null;
    }
  }

  void onEmailSaved(String? value) {
    email = value!;
  }

  void onPasswordSaved(String? value) {
    password = value!;
  }

  Future<void> onLogin(BuildContext context) async {
    if (formKey.currentState == null) {
      return;
    }

    if (!formKey.currentState!.validate()) {
      return;
    }

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    formKey.currentState!.save();
    FocusManager.instance.primaryFocus?.unfocus();

    isLoading(true);

    final resp = await MockSystemApiService.onMockLogin(
      {"userEmail": "demo@evampsaanga.com", "password": "demo@123"},
    );
    if (resp == null) {
      return;
    }
    if (resp.status == 'success') {
      await Preferences.setKey(Preferences.kToken, resp.userInfo!.token!);
      await Preferences.saveUserProfile(resp.userInfo!);
      isLoading(false);
      Get.offAllNamed(Routes.profile);
    } else {
      isLoading(false);
      debugPrint('=====api=====fail');
    }
  }
}
