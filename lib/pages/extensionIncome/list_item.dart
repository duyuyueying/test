import 'package:flutter/material.dart';
import 'package:flutter_zoo/util/colors.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/util/text_style.dart';

class ExtensionIncomeListItem extends StatelessWidget {
  final String phone;
  final String time;
  final String level;

  const ExtensionIncomeListItem(this.phone, this.time, this.level);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Rem.getPxToRem(98), 0, Rem.getPxToRem(98), 0),
      padding: EdgeInsets.fromLTRB(0, Rem.getPxToRem(60), 0, Rem.getPxToRem(60)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(
          color: ZooColors.borderColor1
        ))
      ),
      child: Row(
      children: <Widget>[
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(phone, style: ZooTextStyle.textBlack36,),
          Text(time, style: ZooTextStyle.textGrey30,)
        ],)),
        Text(level, style: ZooTextStyle.textBlackBold42,)
      ],
    ),);
  }
}