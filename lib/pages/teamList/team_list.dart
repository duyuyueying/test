import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/teamList/team_list_widget.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/util/rem.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Widget> tabs = [Text('邀请好友'), Text('扩散好友'), Text('等待激活')];
  @override
  void initState() {
    _controller =
        TabController(initialIndex: 1, length: tabs.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _teamList1Key = PageStorageKey('teamList1Key');
    var _teamList2Key = PageStorageKey('teamList2Key');
    var _teamList3Key = PageStorageKey('teamList3Key');
    return Scaffold(
        backgroundColor: ZooColors.progressBgColor,
        appBar: AppBar(
            elevation: 0,
            bottom: TabBar(
                controller: _controller, //可以和TabBarView使用同一个TabController
                tabs: tabs,
                indicatorColor: ZooColors.mainColor,
                indicatorWeight: Rem.getPxToRem(10),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 5.0),
                // indicator: ,
                labelPadding: EdgeInsets.only(bottom: 8.0),
                labelColor: ZooColors.fontColorBlack,
                unselectedLabelColor: ZooColors.fontColorGrey,
                labelStyle: TextStyle(
                  fontSize: Rem.getPxToRem(42),
                )),
            backgroundColor: ZooColors.whiteColor,
            textTheme: TextTheme(
                title: TextStyle(
                    color: ZooColors.fontColorBlack,
                    fontSize: Rem.getPxToRem(48),
                    fontWeight: FontWeight.w600)),
            iconTheme: IconThemeData(color: ZooColors.fontColorBlack),
            title: Text('团队列表')),
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: Rem.getPxToRem(30)),
          child: TabBarView(controller: _controller, children: <Widget>[
            TeamListWidget(key: _teamList1Key),
            TeamListWidget(key: _teamList2Key),
            TeamListWidget(key: _teamList3Key)
          ]),
        ));
  }
}
