import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class LeftBarController extends GetxController {
  // Controller for the PersistentTabView
  // Current index of the selected screen
  int currentIndex = 0;

  // Update the current index and refresh UI
  void changeTabIndex(int index) {
    currentIndex = index;
    update();
  }
}
