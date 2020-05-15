import 'package:flutter/material.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/util/gap.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/util/text_style.dart';

class SharePage extends StatelessWidget {
  final itemNames = [
    SocialItem('images/wechat@3x.png', '微信', _shareToWechat),
    SocialItem('images/link@3x.png', '复制', _shareToLink),
    SocialItem('images/photo@3x.png', '相册', _shareToPhoto),
  ];
  @override
  Widget build(BuildContext context) {
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
          title: Text('分享海报')),
      body: Container(
          margin: EdgeInsets.only(top: Rem.getPxToRem(30)),
          child: Column(
            children: <Widget>[
            
              Expanded(
                  child: Container(child: Image.asset('images/share.png', fit: BoxFit.contain,), margin: EdgeInsets.only(bottom: Rem.getPxToRem(150)),)),
              Container(
                decoration: BoxDecoration(
                    color: ZooColors.whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                padding: EdgeInsets.fromLTRB(Rem.getPxToRem(50),
                    Rem.getPxToRem(40), Rem.getPxToRem(50), Rem.getPxToRem(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _socialItem(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: Rem.getPxToRem(120),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消', style: ZooTextStyle.textBlue42,),
                  color: ZooColors.whiteColor,
                ),
              )
            ],
          )),
    );
  }

  static _shareToWechat() {
    print('分享到微信');
  }

  static _shareToLink() {
    print('分享到复制');
  }

  static _shareToPhoto() {
    print('分享到相册');
  }

  Future getShareImg() async {
    await Future.delayed(Duration(seconds: 2), () {
      // mounted用来判断当前页面是否还存在的标志
    });
  }

  _socialItem() {
    return itemNames
        .map((item) => GestureDetector(
              onTap: () {
                item.callback();
              },
              child: Column(children: [
                Image.asset(item.imgUrl,
                    width: Rem.getPxToRem(150), height: Rem.getPxToRem(150)),
                ZooGaps.vGap10,
                Text(
                  item.name,
                  style: ZooTextStyle.textGrey30,
                )
              ]),
            ))
        .toList();
  }
}

class SocialItem {
  final String imgUrl;
  final String name;
  final Function callback;

  SocialItem(this.imgUrl, this.name, this.callback);
}
