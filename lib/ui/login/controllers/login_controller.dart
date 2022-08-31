import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  void onInit() {
    super.onInit();
  }

  String? onEmailValidator(String? value){
    if (value == null || value.isEmpty) {
      return "Please enter you email";
    } else {
      return null;
    }
  }
  String? onPasswordValidator(String? value){
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

  Future<void> onLogin() async {
    if (formKey.currentState == null) {
      return;
    }

    if (!formKey.currentState!.validate()) {
      return;
    }

    SystemChannels.textInput.invokeMethod('TextInput.hide');

    formKey.currentState!.save();

    print('==========email => $email ======== pass => $password');
  }
}
