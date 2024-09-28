import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/desktop_home_screen.dart';
import 'package:tamredak/features/desktop_layout/left_bar/presentation/controller/bottom_bar_controller.dart';
class LeftSideNavigationBar extends StatelessWidget {
  const LeftSideNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: GetBuilder<LeftBarController>(
      builder: (controller)=>
          Row(
            children: [
              NavigationRail(
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.notifications),
                    label: Text('Notifications'),
                  ),
                  // Add more destinations as needed
                ],
                selectedIndex: controller.currentIndex,
                onDestinationSelected: controller.changeTabIndex, // Update the index when a destination is selected
              ),
            ],
          ),
    ),);
  }
}
