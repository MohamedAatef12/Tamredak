import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/features/mobile_layout/home/presentation/view/home_screen.dart';
class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkUserAccess() {
    String user = usernameController.text;
    String password = passwordController.text;

    if (user == 'user' && password == '123456') {
      Get.to(const HomeScreen());
    } else {
      Get.snackbar(
        'Login Failed',
        'The username or password is wrong');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
