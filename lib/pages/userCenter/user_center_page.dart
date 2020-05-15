import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/userCenter/user_info_model.dart';
import 'package:flutter_zoo/routes/routes.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/http/api.dart';
import 'package:flutter_zoo/pages/tourTeam/tour_team_model.dart';
import 'package:flutter_zoo/routes/application.dart';
import 'package:flutter_zoo/util/gap.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/util/text_style.dart';

class UserCenterPage extends StatefulWidget {
  @override
  _UserCenterPageState createState() => _UserCenterPageState();
}

class _UserCenterPageState extends State<UserCenterPage> {
  // 个人数据model
  UserInfoModel userInfoModel;
  @override
  void initState() {
    // TODO: implement initState
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZooColors.progressBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headerSection(),
            _wrap(_section2()),
            _wrap(_section3()),
            _wrap(_section4()),
            // _renderInviteBtn()
          ],
        ),
      ),
    );
  }

  // 区域1内容
  Widget _section1(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(Rem.getPxToRem(30), Rem.getPxToRem(58),
            Rem.getPxToRem(30), Rem.getPxToRem(58)),
        child: GestureDetector(
          onTap: (){
            Application.router.navigateTo(context, Routes.bounus);
            _goto(Routes.bounus);
          },
          child:  Row(
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
                  Text(
                    '个人努力必得永久分红熊猫',
                    style: ZooTextStyle.textWhiteBold46,
                  ),
                  ZooGaps.vGap20,
                  Row(
                    children: <Widget>[
                      Text('已完成', style: ZooTextStyle.textWhite30),
                      ZooGaps.hGap10,
                      Text('0.58%', style: ZooTextStyle.textWhite30),
                      ZooGaps.hGap10,
                      Expanded(
                          child: LinearProgressIndicator(
                              value: 0.09,
                              backgroundColor: ZooColors.progressBgColor,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  ZooColors.yellowColor)))
                    ],
                  ),
                ],
              ),
            ),
            ZooGaps.hGap80,
            Icon(
              Icons.keyboard_arrow_right,
              color: ZooColors.black3,
              size: 20,
            )
          ],
        )) );
  }

  // 区域内容2
  Widget _section2() {
    return Column(
      children: <Widget>[
        _renderPacket(),
        _listItem(Icons.chat_bubble_outline, '消息', _goto(Routes.message)),
              ],
            );
          }
        
          // 区域内容3
          Widget _section3() {
            return Column(
              children: <Widget>[
                _listItem(Icons.account_balance_wallet, '我的钱包',_goto(Routes.wallet),
                    extra: Text(
                      '¥1156.21',
                      style: ZooTextStyle.textGreyBold48,
                    ), ),
                _listItem(Icons.group, '渠道合伙人', _goto(Routes.partner)),
                _listItem(Icons.contact_mail, '我的邀请码', _goto(Routes.inviteCode)),
              ],
            );
          }
        
          // 区域内容4
          Widget _section4() {
            return Column(
              children: <Widget>[
                _listItem(Icons.account_box, '实名认证', _goto(Routes.certification)),
                _listItem(Icons.local_library, '帮助中心', _goto(Routes.help)),
                _listItem(Icons.settings, '设置', _goto(Routes.setting)),
              ],
            );
          }
        
          // 红包
          _renderPacket() {
            return Container(
              padding: EdgeInsets.fromLTRB(Rem.getPxToRem(37), Rem.getPxToRem(10),
                    Rem.getPxToRem(37), Rem.getPxToRem(10)),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: ZooColors.borderColor)),
                ),
              child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "images/home.png",
                        width: 40,
                        height: 60,
                      ),
                      ZooGaps.hGap20,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                        Text('升级红包【最高5元】', style: ZooTextStyle.textBlack3_Blod42,),
                        Text('花花升到3级即可领取红包', style: ZooTextStyle.textBlack9_30)
                      ])
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Application.router.navigateTo(context, Routes.share,
                        transition: TransitionType.inFromRight);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '领取',
                        style: TextStyle(fontSize: Rem.getPxToRem(36)),
                      ),
                    ],
                  ),
                  color: ZooColors.yellowColor,
                  textColor: ZooColors.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                )
              ],
            ));
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
                    Application.router.navigateTo(context, Routes.share,
                        transition: TransitionType.inFromRight);
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
                padding: EdgeInsets.fromLTRB(Rem.getPxToRem(47), Rem.getPxToRem(200),
                    Rem.getPxToRem(47), Rem.getPxToRem(60)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "images/home.png",
                      width: 80,
                      height: 80,
                    ),
                    Text(userInfoModel?.phone??'', style: ZooTextStyle.textWhiteBold60),
                    Text(
                      'ID:${userInfoModel?.ids}',
                      style: ZooTextStyle.textWhite36,
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
                      height: Rem.getPxToRem(756),
                    )),
                Column(
                  children: <Widget>[
                    _header(),
                    Container(
                      child: _wrap(_section1(context), isGradient: true),
                    )
                  ],
                ),
              ],
            );
          }
        
          // section容器
          _wrap(Widget child, {bool isGradient = false}) {
            return Container(
              padding:
                  EdgeInsets.fromLTRB(Rem.getPxToRem(47), 0, Rem.getPxToRem(47), 0),
              margin: EdgeInsets.only(top: Rem.getPxToRem(30)),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: isGradient
                              ? [Color(0xff5EE498), Color(0xff36C273)]
                              : [Colors.white, Colors.white])),
                  child: child),
            );
          }
        
          // listItem
          Widget _listItem(IconData icon, String title, Function callback, {Widget extra}) {
            return Container(
                padding: EdgeInsets.fromLTRB(Rem.getPxToRem(37), Rem.getPxToRem(50),
                    Rem.getPxToRem(37), Rem.getPxToRem(50)),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: ZooColors.borderColor)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        Icon(
                          icon,
                          color: ZooColors.mainColor,
                          size: 23,
                        ),
                        ZooGaps.hGap10,
                        Text(
                          title,
                          style: ZooTextStyle.textBlack3_42,
                        ),
                      ],
                    )),
                    extra != null ? extra : Container(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: ZooColors.fontColorGrey,
                    )
                  ],
                ));
          }
        
          void _initData() async {
            print('start=============');
            Map result = await Api.getHomeData();
            if (result["code"] == 0) {
              userInfoModel = UserInfoModel(
                  phone: "13896308941", ids: "123456099", money: 44.21, progress: 0.5);
              setState(() {
                userInfoModel = userInfoModel;
              });
              print("ok========${userInfoModel?.phone}");
            } else {
              print('error====');
            }
          }
        
          _goto(String routeName) {
            // Application.router.navigateTo(context, routeName);
          }
}
