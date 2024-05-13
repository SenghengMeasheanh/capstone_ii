import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
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
        title: '',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: Icon(_persisTabController.index == 0 ? Icons.home : Icons.home_outlined),
      ),
      PersistentBottomNavBarItem(
        title: '',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          _persisTabController.index == 1
              ? Icons.event
              : Icons.event_outlined,
        ),
      ),
      PersistentBottomNavBarItem(
        title: '',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: Icon(
          _persisTabController.index == 2
              ? FluentIcons.ticket_horizontal_20_filled
              : FluentIcons.ticket_horizontal_20_regular,
        ),
      ),
      PersistentBottomNavBarItem(
        title: '',
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.black,
        icon: Icon(_persisTabController.index == 3 ? Icons.person : Icons.person_outlined),
      ),
    ];
  }

  List<Widget> get _buildScreens {
    return [
      const HomeScreen(),
      const EventsScreen(),
      const PassesScreen(),
      const AccountScreen(),
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
      controller: _persisTabController,
      items: _navBarsItems,
      screens: _buildScreens,
      onItemSelected: _onSelectedBottomNavBars,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.white),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }
}
