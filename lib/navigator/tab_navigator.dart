import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/home.dart';
import 'package:flutter_zoo/pages/mine.dart';
import 'package:flutter_zoo/pages/tour_team.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  // BottomNavigationBar的初始化数据
  final itemNames = [
    NavigationItem('images/home.png', 'images/home_curr.png', '动物园'),
    NavigationItem('images/home.png', 'images/home_curr.png', '观光团'),
    NavigationItem('images/home.png', 'images/home_curr.png', '我的'),
  ];
  List<BottomNavigationBarItem> itemList = [];
  // 当前navigationBar的idnex
  int _currIndex = 0;

  PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    _initBottomBarItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        // 禁止滑动
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          TourTeam(),
          MinePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (i){
            setState(() {
              _currIndex = i;
            });
            _controller.jumpToPage(i);
          },
          currentIndex: _currIndex,
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          selectedItemColor: Color(0xff36C273),
          unselectedItemColor: Color(0xffDADDDB),
          items: itemList),
    );
  }

  // 初始化BottomNavigationBar的items
  _initBottomBarItems() {
    itemList = itemNames.map((item) =>
        BottomNavigationBarItem(
            icon: _bottomNavigationBarItemImage(item.iconUrl),
            activeIcon: _bottomNavigationBarItemImage(item.activeIconUrl),
            title: Text(item.title))).toList();
  }

  // 底部导航img封装
  Widget _bottomNavigationBarItemImage(String url) {
    return Image.asset(url, width: 30.0, height: 30.0);
  }
}

// 底部导航model
class NavigationItem {
  final String title;
  final String iconUrl;
  final String activeIconUrl;

  NavigationItem(this.iconUrl, this.activeIconUrl, this.title);
}
