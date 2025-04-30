import 'package:flutter/material.dart';
import 'package:tamredak/features/mobile_layout/database/presentation/views/widgets/database_body.dart';

class DesktopDatabaseScreen extends StatelessWidget {
  const DesktopDatabaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DataBaseBody(),
    );
  }
}
