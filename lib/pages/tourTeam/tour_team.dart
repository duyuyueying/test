import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoo/routes/routes.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/http/api.dart';
import 'package:flutter_zoo/pages/tourTeam/tour_team_model.dart';
import 'package:flutter_zoo/routes/application.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/util/text_style.dart';

class TourTeam extends StatefulWidget {
  @override
  _TourTeamState createState() => _TourTeamState();
}

class _TourTeamState extends State<TourTeam> { 
  // 观光数据model
  TourTeamModel tourTeamModel; 
  // 今日数据/昨日数据tab切换索引
  int _currTabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _initData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F4),
      body: Column(
        children: <Widget>[
          _headerSection(),
          _wrap(_section2()),
          _wrap(_section3(context)),
          _renderInviteBtn()
        ],
      ),
    );
  }

  // 区域内容1
  Widget _section1() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      tourTeamModel?.income.toString(),
                      style: ZooTextStyle.textYellowBold60),
                    Text(
                      '元',
                      style: ZooTextStyle.textYellow32,
                    )
                  ],
                ),
                Text(
                  '当前阶段总收入',
                  style: ZooTextStyle.textGrey34,
                )
              ],
            )),
            Expanded(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text( tourTeamModel?.friendIncome.toString(),
                        style: ZooTextStyle.textBlackBold60),
                    Text('元',
                        style: ZooTextStyle.textBlack32)
                  ],
                ),
                Text(
                  '扩散好友贡献',
                  style: ZooTextStyle.textGrey34,
                )
              ],
            )),
          ],
        ),
        Container(
          padding:
              EdgeInsets.fromLTRB(0, Rem.getPxToRem(50), 0, Rem.getPxToRem(32)),
          child: SizedBox(
            child: LinearProgressIndicator(
                value: 0.01,
                backgroundColor: ZooColors.progressBgColor,
                valueColor:
                    AlwaysStoppedAnimation<Color>(ZooColors.mainColor)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: Rem.getPxToRem(40)),
          margin: EdgeInsets.only(bottom: Rem.getPxToRem(35)),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ZooColors.borderColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '已解锁',
                style: ZooTextStyle.textGrey30,
              ),
              Text('60元',
                  style: ZooTextStyle.textYellow30,
              ),
              Text(
                ',进度',
                style: ZooTextStyle.textGrey30,
              ),
              Text(
                '60%',
                style: ZooTextStyle.textYellow30,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.teamList,transition: TransitionType.inFromRight);
              },
              padding: EdgeInsets.fromLTRB(Rem.getPxToRem(60),
                  Rem.getPxToRem(25), Rem.getPxToRem(60), Rem.getPxToRem(25)),
              borderSide: BorderSide(color: ZooColors.mainColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Row(children: <Widget>[
                Icon(
                  Icons.people,
                  color: ZooColors.mainColor,
                ),
                Text(
                  '团队列表',
                  style: TextStyle(
                      color: ZooColors.mainColor,
                      fontSize: Rem.getPxToRem(36)),
                )
              ]),
            ),
            OutlineButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.extensionIncomeList,transition: TransitionType.inFromRight);
              },
              padding: EdgeInsets.fromLTRB(Rem.getPxToRem(60),
                  Rem.getPxToRem(25), Rem.getPxToRem(60), Rem.getPxToRem(25)),
              borderSide: BorderSide(color: ZooColors.mainColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Row(children: <Widget>[
                Icon(
                  Icons.people,
                  color: ZooColors.mainColor,
                ),
                Text('推广收益',
                    style: ZooTextStyle.textGreen36
                        )
              ]),
            )
          ],
        ),
      ],
    );
  }

  // 区域内容2
  Widget _section2() {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: _currTabIndex == 0 ? ZooColors.mainColor : ZooColors.whiteColor,
                    border: Border.all(color: ZooColors.mainColor),
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(4))),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currTabIndex = 0;
                    });
                  },
                  child: Row(children: <Widget>[
                    Text(
                      '今日收益',
                      style: TextStyle(
                          color: _currTabIndex != 0 ? ZooColors.mainColor : ZooColors.whiteColor,
                          fontSize: Rem.getPxToRem(30)),
                    )
                  ]),
                ),
                padding: EdgeInsets.fromLTRB(Rem.getPxToRem(42),
                    Rem.getPxToRem(10), Rem.getPxToRem(42), Rem.getPxToRem(10)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: _currTabIndex == 1 ? ZooColors.mainColor : ZooColors.whiteColor,
                    border: Border.all(color: ZooColors.mainColor),
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(4))),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currTabIndex = 1;
                    });
                  },
                  child: Row(children: <Widget>[
                    // Icon(
                    //   Icons.people,
                    //   color: StyleConfig.mainColor,
                    // ),
                    Text(
                      '昨日收益',
                      style: TextStyle(
                          color: _currTabIndex != 1 ? ZooColors.mainColor : ZooColors.whiteColor,
                          fontSize: Rem.getPxToRem(30)),
                    )
                  ]),
                ),
                padding: EdgeInsets.fromLTRB(Rem.getPxToRem(42),
                    Rem.getPxToRem(10), Rem.getPxToRem(42), Rem.getPxToRem(10)),
              )
            ],
          ),
          margin: EdgeInsets.only(bottom: Rem.getPxToRem(53)),
        ),
        Offstage(
          offstage: _currTabIndex == 0,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('0.00',
                        style: ZooTextStyle.textYellowBold60),
                    Text('元',
                        style: ZooTextStyle.textYellow32)
                  ],
                ),
                Text(
                  '总收益111',
                  style: ZooTextStyle.textGrey28,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('0.00',
                        style: ZooTextStyle.textYellowBold60),
                    Text('元',
                        style: ZooTextStyle.textYellow32)
                  ],
                ),
                Text(
                  '邀请好友贡献',
                  style: ZooTextStyle.textGrey28,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('0.00',
                        style: ZooTextStyle.textBlackBold60),
                    Text('元',
                        style: ZooTextStyle.textBlack32)
                  ],
                ),
                Text(
                  '扩散好友贡献',
                  style: ZooTextStyle.textGrey28,
                )
              ],
            ),
          ],
        ),
        ),
        Offstage(
          offstage: _currTabIndex == 1,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('0.00',
                        style: ZooTextStyle.textYellowBold60),
                    Text('元',
                        style: ZooTextStyle.textYellow32)
                  ],
                ),
                Text(
                  '总收益',
                  style: ZooTextStyle.textGrey28,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('0.00',
                        style: ZooTextStyle.textBlackBold60),
                    Text('元',
                        style: ZooTextStyle.textBlack32)
                  ],
                ),
                Text(
                  '邀请好友贡献',
                  style: ZooTextStyle.textGrey28,
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('0.00',
                        style: ZooTextStyle.textBlackBold60),
                    Text('元',
                        style: ZooTextStyle.textBlack32)
                  ],
                ),
                Text(
                  '扩散好友贡献',
                  style: ZooTextStyle.textGrey28,
                )
              ],
            ),
          ],
        ),
        ),
      ],
    );
  }

  // 区域3内容
  Widget _section3(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          "images/home.png",
          width: 80,
          height: 80,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '分红凤凰：0.98%',
              style: ZooTextStyle.textBlack36,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, Rem.getPxToRem(10), 0, Rem.getPxToRem(10)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - Rem.getPxToRem(424),
                child: LinearProgressIndicator(
                    value: 0.09,
                    backgroundColor: ZooColors.progressBgColor,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        ZooColors.mainColor)),
              ),
            ),
            Text(
              '限量10000只，先到先得，领完截止',
              style: ZooTextStyle.textBlack30,
            )
          ],
        )
      ],
    );
  }

  // 邀请二维码button
  Widget _renderInviteBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          Rem.getPxToRem(80), Rem.getPxToRem(80), Rem.getPxToRem(80), 0),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: Rem.getPxToRem(138)),
        child: FlatButton(
          onPressed: () {
           Application.router.navigateTo(context, Routes.share,transition: TransitionType.inFromRight);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.dashboard),
              Text(
                '邀请二维码',
                style: TextStyle(fontSize: Rem.getPxToRem(48)),
              ),
            ],
          ),
          color: ZooColors.mainColor,
          textColor: ZooColors.whiteColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
        ),
      ),
    );
  }

  // 顶部
  Widget _header() {
    return Container(
        padding: EdgeInsets.fromLTRB(
            Rem.getPxToRem(47), Rem.getPxToRem(200), Rem.getPxToRem(47), 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '合成动物越高级',
                  style: TextStyle(
                      color: ZooColors.whiteColor,
                      fontSize: Rem.getPxToRem(34)),
                ),
                Text(
                  '我的收入越高',
                  style: TextStyle(
                      color: ZooColors.whiteColor,
                      fontSize: Rem.getPxToRem(57)),
                )
              ],
            ),
            Image.asset(
              "images/home.png",
              width: 80,
              height: 80,
            )
          ],
        ));
  }

  // 顶部+section1
  Widget _headerSection() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
            color: Color(0xFFF3F5F4),
            child: Container(
              color: ZooColors.mainColor,
              height: Rem.getPxToRem(595),
            )),
        Column(
          children: <Widget>[
            _header(),
            Container(
              child: _wrap(_section1()),
            )
          ],
        ),
      ],
    );
  }

  // section容器
  _wrap(Widget child) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(Rem.getPxToRem(47), 0, Rem.getPxToRem(47), 0),
      margin: EdgeInsets.only(top: Rem.getPxToRem(30)),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(Rem.getPxToRem(56)),
            child: child,
          )),
    );
  }

  // 统一字体
  _commonText(String title,
      {Color fontColor, int fontSize, FontWeight fontWeight}) {
    return Text(
      title,
      style: TextStyle(
          color: fontColor == null
              ? ZooColors.fontColorBlack
              : ZooColors.yellowColor,
          fontSize: Rem.getPxToRem(fontSize),
          fontWeight: fontWeight == null ? FontWeight.w400 : FontWeight.w600),
    );
  }

  void _initData() async{
    print('start=============');
    Map result = await Api.getHomeData();
    if(result["code"] == 0) {
      tourTeamModel = TourTeamModel(income: 12.12, friendIncome: 200.00);
      setState(() {
        tourTeamModel = tourTeamModel;
      });
      print("ok========${tourTeamModel.friendIncome}");
    } else {
      print('error====');
    }
  }
}
