import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/desktop_home_screen.dart';

class DesktopLoginController extends GetxController {
  // Add TextEditingController for username and password
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to check user access
  void checkUserAccessDesktop() {
    // Get the entered text from the controllers
    String user = usernameController.text;
    String password = passwordController.text;

    if (user == 'user' && password == '123456') {
      Get.to(const DesktopHomePage());
    } else {
      Get.snackbar(
        'Login Failed',
        'The username or password is wrong',
      );
    }
  }

  @override
  void onClose() {
    // Dispose controllers when not in use to prevent memory leaks
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
