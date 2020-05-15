import 'package:flutter/material.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/util/rem.dart';

class ZooTextStyle{
  static double font_sp28 = Rem.getPxToRem(28);
  static double font_sp30 = Rem.getPxToRem(30);
  static double font_sp32 = Rem.getPxToRem(32);
  static double font_sp34 = Rem.getPxToRem(34);
  static double font_sp36 = Rem.getPxToRem(36);
  static double font_sp42 = Rem.getPxToRem(42);
  static double font_sp46 = Rem.getPxToRem(46);
  static double font_sp48 = Rem.getPxToRem(48);
  static double font_sp60 = Rem.getPxToRem(60);

  static const double gap_dp4 = 4;
  static const double gap_dp5 = 5;
  static const double gap_dp8 = 8;
  static const double gap_dp10 = 10;
  static const double gap_dp12 = 12;
  static const double gap_dp15 = 15;
  static const double gap_dp16 = 16;
  static const double gap_dp24 = 24;
  static const double gap_dp32 = 32;
  static const double gap_dp50 = 50;

  // 黄色
  static TextStyle textYellow30 = TextStyle(
    color: ZooColors.yellowColor,
    fontSize: font_sp30,
  );
  static TextStyle textYellow32 = TextStyle(
    color: ZooColors.yellowColor,
    fontSize: font_sp32
  );
  static TextStyle textYellowBold60 = TextStyle(
    color: ZooColors.yellowColor,
    fontSize: font_sp60,
    fontWeight: FontWeight.w600
  );
  

  // 黑色
  static TextStyle textBlack30 = TextStyle(
    color: ZooColors.fontColorBlack,
    fontSize: font_sp30
  );
  static TextStyle textBlack32 = TextStyle(
    color: ZooColors.fontColorBlack,
    fontSize: font_sp32
  );
  static TextStyle textBlack36 = TextStyle(
    color: ZooColors.fontColorBlack,
    fontSize: font_sp36
  );
  // static TextStyle textBlack42 = TextStyle(
  //   color: ZooColors.black3,
  //   fontSize: font_sp42,
  // );
  static TextStyle textBlackBold42 = TextStyle(
    color: ZooColors.fontColorBlack,
    fontSize: font_sp42,
    fontWeight: FontWeight.w600
  );
  static TextStyle textBlackBold60 = TextStyle(
    color: ZooColors.fontColorBlack,
    fontSize: font_sp60,
    fontWeight: FontWeight.w600
  );

  // #333
  static TextStyle textBlack3_42 = TextStyle(
    color: ZooColors.black3,
    fontSize: font_sp42,
  );
   static TextStyle textBlack3_Blod42 = TextStyle(
    color: ZooColors.black3,
    fontSize: font_sp42,
    fontWeight: FontWeight.w600
  );
  // #999
  static TextStyle textBlack9_30 = TextStyle(
    color: ZooColors.black3,
    fontSize: font_sp30,
  );
  

  // 灰色
  static TextStyle textGrey28 = TextStyle(
    color: ZooColors.fontColorGrey,
    fontSize: font_sp28
  );
  static TextStyle textGrey30 = TextStyle(
    color: ZooColors.fontColorGrey,
    fontSize: font_sp30
  );
  static TextStyle textGrey34 = TextStyle(
    color: ZooColors.fontColorGrey,
    fontSize: font_sp34
  );
  static TextStyle textGreyBold48 = TextStyle(
    color: ZooColors.fontColorGrey,
    fontSize: font_sp48,
    fontWeight: FontWeight.w600
  );
  
  // 绿色
  static TextStyle textGreen36 = TextStyle(
    color: ZooColors.mainColor,
    fontSize: font_sp36
  );

  // 蓝色
  static TextStyle textBlue42 = TextStyle(
    color: ZooColors.blueColor,
    fontSize: font_sp42
  );

  // 白色
  static TextStyle textWhite30 = TextStyle(
    color: ZooColors.whiteColor,
    fontSize: font_sp30
  );
  static TextStyle textWhite36 = TextStyle(
    color: ZooColors.whiteColor,
    fontSize: font_sp36
  );
  static TextStyle textWhiteBold46 = TextStyle(
    color: ZooColors.whiteColor,
    fontSize: font_sp46,
    fontWeight: FontWeight.w600
  );
   static TextStyle textWhiteBold60 = TextStyle(
    color: ZooColors.whiteColor,
    fontSize: font_sp60,
    fontWeight: FontWeight.w600
  );
}