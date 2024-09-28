import 'package:flutter/material.dart';
import 'package:tamredak/features/desktop_layout/login/presentations/views/widgets/desktop_login_body.dart';
class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DesktopLoginBody(),
    );
  }
}
