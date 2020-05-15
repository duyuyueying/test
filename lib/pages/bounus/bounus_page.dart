import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/extensionIncome/list_item.dart';
import 'package:flutter_zoo/pages/teamList/team_list_widget.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/util/gap.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/util/text_style.dart';
import 'package:flutter_zoo/widget/zoo_refresh_list.dart';

class BounusPage extends StatefulWidget {
  @override
  _BounusPageState createState() => _BounusPageState();
}

class _BounusPageState extends State<BounusPage> {
  int _page = 1;
  List _datalist = [];
  bool _noData = false;
  @override
  void initState() {
    getData();
    print('initState=======');
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      print('WidgetsBinding======');
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build=======');
    DateTime _selectedDate = DateTime.now();
    return Scaffold(
      backgroundColor: ZooColors.progressBgColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: ZooColors.whiteColor,
          textTheme: TextTheme(
              title: TextStyle(
                  color: ZooColors.fontColorBlack,
                  fontSize: Rem.getPxToRem(48),
                  fontWeight: FontWeight.w600)),
          iconTheme: IconThemeData(color: ZooColors.fontColorBlack),
          title: Text('必得永久分红熊猫')),
      body: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: Rem.getPxToRem(30)),
          child: Column(children: [
            SizedBox( height: 300,child: DayPicker(
              selectedDate: _selectedDate,
              currentDate: DateTime.now(),
              onChanged: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
              firstDate: DateTime(2020, 5, 1),
              lastDate: DateTime(2020, 5, 31),
              displayedMonth: DateTime(2020, 5),
            ),),
           
            Container(
              color: ZooColors.whiteColor,
              padding: EdgeInsets.fromLTRB(Rem.getPxToRem(50),
                  Rem.getPxToRem(150), Rem.getPxToRem(50), 0),
              child: Column(
                children: <Widget>[
                  _renderProgress(),
                  Text('提升进度途径'),
                  _listItem("images/home.png", "邀请好友", "邀请旅伴越多越活跃，速度越快"),
                  _listItem("images/home.png", "提升活跃", "看视频，合成熊猫的次数越多，速度越快"),
                ],
              ),
            )
          ])),
    );
  }

  // 进度条
  _renderProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "images/home.png",
          width: 60,
          height: 60,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Row(children: [
                    Text(
                      '我的永久分红熊猫',
                      style: ZooTextStyle.textBlackBold42,
                    ),
                    ZooGaps.hGap10,
                    Icon(
                      Icons.help_outline,
                      color: ZooColors.fontColorGrey,
                      size: 20,
                    )
                  ])),
                  Text('0.58%', style: ZooTextStyle.textBlackBold42),
                ],
              ),
              ZooGaps.vGap20,
              Row(
                children: <Widget>[
                  Expanded(
                      child: LinearProgressIndicator(
                          value: 0.09,
                          backgroundColor: ZooColors.progressBgColor,
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              ZooColors.mainColor)))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  //
  _listItem(String imgUrl, String title, String subTitle) {
    return Row(
      children: <Widget>[
        Image.asset(
          imgUrl,
          width: 60,
          height: 60,
        ),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(title), Text(subTitle)])),
        Icon(Icons.keyboard_arrow_right)
      ],
    );
  }

  Future getData() async {
    // await Future.delayed(Duration(seconds: 2), () {
    //   // mounted用来判断当前页面是否还存在的标志
    //   if(mounted) {
    //     setState(() {
    //       // _noData = true;
    //       _page = 1;
    //       _datalist = List.generate(15, (i) => '哈喽,我是原始数据 $i');
    //     });
    //   }
    // });
  }
}
