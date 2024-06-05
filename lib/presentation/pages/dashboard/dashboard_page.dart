import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final dashboardStreamController = StreamController.broadcast();

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // * Controller
  final _persisTabController = PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    // * Listen Stream Controller
    dashboardStreamController.stream.listen((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _persisTabController.dispose();
  }

  List<PersistentBottomNavBarItem> get _navBarsItems {
    return [
      PersistentBottomNavBarItem(
        title: 'Home',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: Icon(_persisTabController.index == 0 ? Icons.home : Icons.home_outlined),
      ),
      PersistentBottomNavBarItem(
        title: 'Bookmark',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: const Icon(
          Icons.bookmark_border,
        ),
      ),
      PersistentBottomNavBarItem(
        title: 'Calendar',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          _persisTabController.index == 2 ? Icons.event : Icons.event_outlined,
        ),
      ),
      PersistentBottomNavBarItem(
        title: 'Setting',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: const Icon(Icons.menu),
      ),
    ];
  }

  List<Widget> get _buildScreens {
    return [
      const HomeScreen(),
      const EventsScreen(),
      const CalenderScreen(),
      const SettingScreen(),
    ];
  }

  void _onSelectedBottomNavBars(int index) {
    // * Select Tab Index
    if (mounted) setState(() => _persisTabController.index = index);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 70,
      controller: _persisTabController,
      items: _navBarsItems,
      screens: _buildScreens,
      onItemSelected: _onSelectedBottomNavBars,
      handleAndroidBackButtonPress: true,
      confineInSafeArea: true,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.red),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      padding: const NavBarPadding.only(top: 15, left: 1, right: 1),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
