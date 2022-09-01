import 'package:evamp_task_app/components/custom_image.dart';
import 'package:evamp_task_app/constants/k_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: const EdgeInsets.all(40),
            children: [
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomImage(
                  imagePath: 'assets/images/e_letter.png',
                  height: 80,
                  width: 80,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  height: 2,
                  width: 55,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome to\nDemo App\nLogin',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                validator: controller.onEmailValidator,
                onSaved: controller.onEmailSaved,
                cursorColor: whiteColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: whiteColor,
                  ),
                  labelText: 'Enter Your Email',
                ),
                style: const TextStyle(color: whiteColor),
              ),
              const SizedBox(height: 40),
              TextFormField(
                textInputAction: TextInputAction.done,
                validator: controller.onPasswordValidator,
                onSaved: controller.onPasswordSaved,
                cursorColor: whiteColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.password_outlined,
                    color: whiteColor,
                  ),
                  labelText: 'Enter Password',
                ),
                style: const TextStyle(color: whiteColor),
              ),
              const SizedBox(height: 40),
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    controller.onLogin(context);
                  },
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: whiteColor)
                      : const Text(
                          'LOGIN',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
