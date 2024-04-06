import 'package:flutter/material.dart';
import 'package:tamredak/features/all_nurses/presentation/views/all_nurses_screen.dart';
import 'package:tamredak/features/database/presentation/views/database_screen.dart';
import 'package:tamredak/features/home/presentation/view/home_screen.dart';


List<Widget> buildScreens() {
  return [
    const HomeScreen(),
    const AllNursesScreen(),
    const DatabaseScreen(),
  ];
}
