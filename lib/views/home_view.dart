import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:netlyfe/Utils/bottom_nav_icon_list.dart';
import 'package:netlyfe/fragments/article_fragment.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/consult_doctor_view.dart';
import 'package:netlyfe/fragments/monitor_fragment.dart';
import 'package:netlyfe/fragments/profile_fragment.dart';
import 'package:netlyfe/fragments/store_fragment.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void onItemTapped(index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController!.animateToPage(index,
        duration: const Duration(microseconds: 100), curve: Curves.easeIn);
  }

  Future _onWillPop() async {
    if (selectedIndex != 0) {
      setState(() => selectedIndex = 0);
      _pageController!.animateToPage(0,
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      await SystemChannels.platform
          .invokeMethod<void>('SystemNavigator.pop', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await _onWillPop(),
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar(context),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [
            StoreFragment(),
            MonitorFragment(),
            ArticleFragment(),
            ProfileFragment()
          ],
        ),
      ),
    );
  }

  AnimatedBottomNavigationBar bottomNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar(
        icons: navIconList,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.none,
        iconSize: 20,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        backgroundColor: context.theme.backgroundColor,
        activeColor: appColor,
        inactiveColor: Colors.grey.shade400,
        splashColor: appColor,
        onTap: (index) => onItemTapped(index));
  }
}
