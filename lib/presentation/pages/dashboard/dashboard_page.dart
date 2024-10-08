import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class DashboardPage extends StatefulWidget {
  final int? index;
  const DashboardPage({
    super.key,
    this.index,
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
    languageStreamController.stream.listen((_) => setState(() {}));
    // * Set Index
    if (widget.index != null) {
      _persisTabController.jumpToTab(widget.index!);
    }
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
          title: tr(LocaleKeys.home),
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
        screen: const UnderConstructionPage(),
        item: ItemConfig(
          iconSize: 18,
          title: tr(LocaleKeys.bookmark),
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
        screen: const UnderConstructionPage(),
        item: ItemConfig(
          iconSize: 18,
          activeForegroundColor: primaryColor,
          title: tr(LocaleKeys.calendar),
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
        screen: const AccountScreen(),
        item: ItemConfig(
          iconSize: 18,
          title: tr(LocaleKeys.account),
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
      controller: _persisTabController,
      navBarOverlap: const NavBarOverlap.none(),
      navBarHeight: 70,
      tabs: _navBarsTab,
      hideNavigationBar: false,
      navBarBuilder: (navBarConfig) => Style7BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
