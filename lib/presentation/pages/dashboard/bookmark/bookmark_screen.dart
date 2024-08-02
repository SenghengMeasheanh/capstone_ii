import 'package:capstone_ii/helper/helper_export.dart';
import 'package:capstone_ii/presentation/presentation_export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> with SingleTickerProviderStateMixin {
  // * Tabs
  List<Tab> tabs = [
    Tab(
      text: tr(LocaleKeys.university),
    ),
    Tab(
      text: tr(LocaleKeys.career),
    ),
    Tab(
      text: tr(LocaleKeys.events),
    ),
    Tab(
      text: tr(LocaleKeys.guides),
    ),
    Tab(
      text: tr(LocaleKeys.scholarships),
    ),
  ];
  // * TabController
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            height: 70,
            color: Colors.white,
            child: TabBar(
              indicatorColor: Colors.deepOrange,
              labelColor: Colors.black,
              isScrollable: true,
              controller: _tabController,
              tabs: tabs,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BookmarkUniversityTab(),
          BookmarkCareerTab(),
          BookmarkEventsTab(),
          BookmarkGuideTab(),
          BookmarkScholarshipTab(),
        ],
      ),
    );
  }
}
