import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopHomeController extends GetxController {
  // PageController for PageView
  var pageController = PageController();

  // Reactive selectedIndex to track the currently selected menu item
  var selectedIndex = 0.obs;

  // Use Color type instead of MaterialColor
  var primaryColor = Colors.green.obs; // Color for الرئيسيه
  var secondaryColor = Colors.white.obs; // Color for البيانات

  // Function to change page and update selected index and colors
  void changePage(int index) {
    selectedIndex.value = index;

    // Update colors based on the selected index
    if (index == 0) {
      primaryColor.value = Colors.green; // Color for الرئيسيه
      secondaryColor.value = Colors.white; // Default color for البيانات
    } else if (index == 1) {
      primaryColor.value = Colors.grey; // Default color for الرئيسيه
      secondaryColor.value = Colors.green; // Color for البيانات
    }

    pageController.jumpToPage(index);
  }
}
