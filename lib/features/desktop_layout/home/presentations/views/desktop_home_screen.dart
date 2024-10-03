import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamredak/core/utils/assets.dart';
import 'package:tamredak/features/desktop_layout/add_nurse/presentations/views/widgets/desktop_add_nurse_body.dart';
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
            title: Column(
              children: [
                Image(
                  image: const AssetImage(Assets.logo),
                  height: 200.r,
                  fit: BoxFit.cover,
                ),
                Text('تمريضك',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.spMin,
                        fontWeight: FontWeight.bold)),
                10.verticalSpace,
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  10.verticalSpace,
                  Text(
                    'تم تطوير هذا الموقع بواسطة فريق تمريضك',
                    style: TextStyle(color: Colors.white, fontSize: 18.spMin),
                  ),
                  5.verticalSpace,
                  Text(
                    'جميع الحقوق محفوظه لتمريضك',
                    style: TextStyle(color: Colors.white, fontSize: 18.spMin),
                  ),
                  10.verticalSpace,
                  Center(
                    child: Text(
                      'Version 1.0',
                      style: TextStyle(
                          color: Colors.grey[200]!, fontSize: 18.spMin),
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
                    const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    1.horizontalSpace,
                    Text(
                      'الرئيسية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.spMin,
                      ),
                    ),
                  ],
                ),
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
              ),
              SideMenuExpansionItem(
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  title: 'الممرضين',
                  children: [
                    SideMenuItem(
                      title: '',
                      iconWidget: Row(
                        children: [
                          const Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Colors.white,
                          ),
                          1.horizontalSpace,
                          Text(
                            'اضافه ممرض',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.spMin,
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
                          const Icon(
                            Icons.person_search_outlined,
                            color: Colors.white,
                          ),
                          1.horizontalSpace,
                          Text(
                            'الممرضين المتاحين',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.spMin,
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
                          const Icon(
                            Icons.person_off_outlined,
                            color: Colors.white,
                          ),
                          1.horizontalSpace,
                          Text(
                            'الممرضين المشغولين',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.spMin,
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
                    const Icon(
                      Icons.space_dashboard_outlined,
                      color: Colors.white,
                    ),
                    1.horizontalSpace,
                    Text(
                      'قاعده البيانات',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.spMin,
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
                DataBaseBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
