import 'package:flutter/material.dart';
import 'package:tamredak/features/mobile_layout/login/presentation/views/widgets/login_body.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: LoginBody());
  }
}
