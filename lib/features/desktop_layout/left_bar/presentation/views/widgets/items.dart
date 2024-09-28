import 'package:easy_sidemenu/easy_sidemenu.dart';

List<SideMenuItem> items = [
  SideMenuItem(
    title: 'Dashboard',
    onTap: (index, _) {
      sideMenu.changePage(index);
    },
    icon: Icon(Icons.home),
    badgeContent: Text(
      '3',
      style: TextStyle(color: Colors.white),
    ),
  ),
  SideMenuExpansionItem(
    title: "Expansion Item",
    icon: const Icon(Icons.kitchen),
    children: [
      SideMenuItem(
        title: 'Expansion Item 1',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.home),
      ),
      SideMenuItem(
        title: 'Expansion Item 2',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.supervisor_account),
      )
    ],
  ),
  SideMenuItem(
    title: 'Exit',
    onTap: () {},
    icon: Icon(Icons.exit_to_app),
  ),
];