import 'package:eskool/core/controllers/dashboard_bottombar_controller.dart';
import 'package:eskool/ui/views/dashboard_view.dart';
import 'package:eskool/ui/views/more_menu_view.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../colors.dart';
import 'profile_view.dart';

class MainView extends StatelessWidget {
  final _tabController = Get.put(DashboardBottomBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(DashboardBottomBarController()),
      builder: (DashboardBottomBarController _tabController) {
        return PersistentTabView(
          context,
          screens: _screens(),
          controller: _tabController.tabController,
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          decoration: NavBarDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 0.5,
            ),
          ]),
        );
      },
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.square_grid_2x2),
        title: ("Dashboard"),
        activeColorPrimary: colorPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.ellipsis),
        title: ("More"),
        activeColorPrimary: colorDarkGold,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  List<Widget> _screens() {
    return [DashboardView(), ProfileView(), MoreMenuView()];
  }
}
