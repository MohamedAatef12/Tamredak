import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/widgets/desktop_add_nurse_body.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/desktop_all_nurses_screen.dart';
import 'package:tamredak/features/desktop_layout/all_nurses_desktop/presentation/views/widgets/desktop_all_nurses_body.dart';
import 'package:tamredak/features/desktop_layout/available_nurse/presentation/view/widgets/desktop_available_nurses_body.dart';
import 'package:tamredak/features/desktop_layout/database/presentation/views/widgets/database_body.dart';
import 'package:tamredak/features/desktop_layout/home/presentations/views/widgets/desktop_home_body.dart';
import 'package:tamredak/features/desktop_layout/in%20task_nurse/presentation/views/widgets/desktop_in_task_body.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            controller: sideMenu,
            title: Image(
              image: const AssetImage(Assets.logo),
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  10.verticalSpace,
                  Text(
                    '-This system was developed by Tamredak team',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.sizeOf(context).width * 0.01),
                    textDirection: TextDirection.ltr,
                  ),
                  5.verticalSpace,
                  Text(
                    '-All rights reserved to Tamredak team',
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.sizeOf(context).width * 0.01),
                    textDirection: TextDirection.ltr,
                  ),
                  10.verticalSpace,
                  Center(
                    child: Text(
                      'Version 1.0',
                      style: TextStyle(
                          color: Colors.grey[200]!, fontSize: MediaQuery.sizeOf(context).width * 0.01),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              openSideMenuWidth: 250,
              hoverColor: Colors.blue[200],
              selectedColor: Colors.lightBlue,
              unselectedIconColor: Colors.white,
              backgroundColor: Colors.blueGrey[300],
              selectedTitleTextStyleExpandable: TextStyle(
                color: Colors.white,
                fontSize: 18.spMin,
              ),
              selectedIconColorExpandable: Colors.white,
              unselectedIconColorExpandable: Colors.white,
              selectedIconColor: Colors.white,
              selectedTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.spMin,
              ),
              unselectedTitleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.spMin,
              ),
              itemInnerSpacing: 5.0,
              itemBorderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              itemHeight: 50.0,
              itemOuterPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              toggleColor: Colors.white,
            ),
            items: [
              SideMenuItem(
                title: '',
                iconWidget: Row(
                  children: [
                     Icon(
                      Icons.home,
                      color: Colors.white,
                      size:MediaQuery.sizeOf(context).width * 0.015,
                    ),
                    5.horizontalSpace,
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).width * 0.013,
                      ),
                    ),
                  ],
                ),
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
              ),
              SideMenuExpansionItem(
                  icon:  Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: MediaQuery.sizeOf(context).width * 0.015,
                  ),
                  title: 'Nurses',
                  children: [
                    SideMenuItem(
                      title: '',
                      iconWidget: Row(
                        children: [
                           Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Colors.white,
                            size: MediaQuery.sizeOf(context).width * 0.015,
                          ),
                          5.horizontalSpace,
                          Text(
                            'Add Nurse',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.sizeOf(context).width * 0.013,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Spacer(),
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: '',
                      iconWidget: Row(
                        children: [
                           Icon(
                            Icons.person_search_outlined,
                            color: Colors.white,
                            size: MediaQuery.sizeOf(context).width * 0.015,
                          ),
                          5.horizontalSpace,
                          Text(
                            'Available Nurses',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.sizeOf(context).width * 0.013,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Spacer(),
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: '',
                      iconWidget: Row(
                        children: [
                           Icon(
                            Icons.person_off_outlined,
                            color: Colors.white,
                            size: MediaQuery.sizeOf(context).width * 0.015,
                          ),
                          5.horizontalSpace,
                          Text(
                            'In Task Nurses',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.sizeOf(context).width * 0.013,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Spacer(),
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: '',
                      iconWidget: Row(
                        children: [
                          Icon(
                            Icons.people,
                            color: Colors.white,
                            size: MediaQuery.sizeOf(context).width * 0.015,
                          ),
                          5.horizontalSpace,
                          Text(
                            'All Nurses',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.sizeOf(context).width * 0.013,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Spacer(),
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                  ]),
              SideMenuItem(
                title: '',
                iconWidget: Row(
                  children: [
                     Icon(
                      Icons.space_dashboard_outlined,
                      color: Colors.white,
                      size: MediaQuery.sizeOf(context).width * 0.015,
                    ),
                    5.horizontalSpace,
                    Text(
                        'Transactions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.sizeOf(context).width * 0.013,
                      ),
                    ),
                  ],
                ),
                trailing: const Spacer(),
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
              ),

            ],
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                DesktopHomeBody(),
                DesktopAddNurseBody(),
                DesktopAvailableNursesBody(),
                DesktopInTaskBody(),
                DesktopAllNursesBody(),
                DesktopDataBaseBody(),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
