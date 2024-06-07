import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

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

  List<PersistentTabConfig> get _navBarsTab {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          iconSize: 18,
          activeForegroundColor: primaryColor,
          title: 'Home',
          inactiveIcon: SvgPicture.asset(
            Assets.iconHome,
          ),
          icon: SvgPicture.asset(
            Assets.iconHome,
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const EventsScreen(),
        item: ItemConfig(
          iconSize: 18,
          title: 'Bookmark',
          activeForegroundColor: primaryColor,
          inactiveIcon: SvgPicture.asset(
            Assets.iconBookmarkOulined,
          ),
          icon: SvgPicture.asset(
            Assets.iconBookmarkOulined,
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const CalenderScreen(),
        item: ItemConfig(
          iconSize: 18,
          activeForegroundColor: primaryColor,
          title: 'Calendar',
          inactiveIcon: SvgPicture.asset(
            Assets.iconCalendar,
          ),
          icon: SvgPicture.asset(
            Assets.iconCalendar,
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const SettingScreen(),
        item: ItemConfig(
          iconSize: 18,
          title: 'Account',
          activeForegroundColor: primaryColor,
          inactiveIcon: SvgPicture.asset(
            Assets.iconAccount,
          ),
          icon: SvgPicture.asset(
            Assets.iconAccount,
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,
      tabs: _navBarsTab,
      navBarBuilder: (navBarConfig) => Style7BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
