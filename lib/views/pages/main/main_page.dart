import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domen/data/data.dart';
import '../../app_const.dart';
import '../contact/get_in_touch_page.dart';
import '../about/my_skill_page.dart';
import 'navigation.dart';
import '../projects/projects.dart';
import 'tab_bar.dart';
import '../about/about_page.dart';
import '../home/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _downloadCV() {
    launch(Data.CV_URL);
  }

  void _hireMe() {
    scrollToIndex(keys.length - 1);
  }

  Widget pagePadding([Key? key]) => SizedBox(
    key: key,
    height: PAGE_PADDING_SIZE,
  );

  Widget _homePage() {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Opacity(
            child: Navigation((_) {}),
            opacity: 0,
          ),
          Positioned.fill(
            child: HomePage(
              key: keys[0],
              downloadCV: _downloadCV,
              hireMe: _hireMe,
            ),
          )
        ],
      ),
    );
  }

  final keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Widget _buildListDetail(bool forTablet) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: VERTICAL_PADDING_SIZE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: VERTICAL_PADDING_SIZE),
          Visibility(visible: !forTablet, child: AppTabBar()),
          _homePage(),
          pagePadding(),
          AboutPage(keys[1], _downloadCV, _hireMe),
          pagePadding(),
          MySkillPage(keys[4]),
          pagePadding(),
          ProjectsPage(keys[2]),
          pagePadding(),
          GetInTouchPage(keys[3]),
        ],
      ),
    );
  }

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      duration: Duration(milliseconds: 500),
    );
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? VERTICAL_PADDING_SIZE : 0),
      child: Navigation((index) {
        scrollToIndex(index);
      }),
    );
  }

  Widget _buildTabletBody(double width) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true),
          SizedBox(width: 24),
          LimitedBox(
            maxWidth: 720,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  Widget _buildPhoneBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return constrain.maxWidth >= MIN_TABLET_SIZE
            ? _buildTabletBody(constrain.maxWidth)
            : _buildPhoneBody();
      },
    );
  }
}