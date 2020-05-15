import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/bounus/bounus_page.dart';
import 'package:flutter_zoo/pages/certification/certification_page.dart';
import 'package:flutter_zoo/pages/extensionIncome/extension_income_page.dart';
import 'package:flutter_zoo/pages/help/hellp_page.dart';
import 'package:flutter_zoo/pages/inviteCode/invite_code_page.dart';
import 'package:flutter_zoo/pages/message/message_page.dart';
import 'package:flutter_zoo/pages/partner/partner_page.dart';
import 'package:flutter_zoo/pages/register.dart';
import 'package:flutter_zoo/pages/setting/setting_page.dart';
import 'package:flutter_zoo/pages/share/share_page.dart';
import 'package:flutter_zoo/pages/teamList/team_list.dart';
import 'package:flutter_zoo/pages/wallet/wallet_page.dart'; 

class Routes{
  static String register = '/register'; // 注册页面
  static String teamList = '/tourTeam/teamList'; // 观光团/团队列表
  static String extensionIncomeList = '/tourTeam/extension_income_page'; // 观光团/推广收益
  static String share = '/tourTeam/share'; //  观光团/邀请二维码
  
  static String bounus = '/userCenter/bounus'; // 个人中心/分红
  static String message = '/userCenter/message';// 个人中心/消息
  static String wallet = '/userCenter/wallet';// 个人中心/钱包
  static String partner = '/userCenter/partner'; // 个人中心/合伙人
  static String inviteCode = '/userCenter/inviteCode';// 个人中心/邀请码
  static String certification = '/userCenter/certification';// 个人中心/实名认证
  static String help = '/userCenter/help';// 个人中心/帮助中心
  static String setting = '/userCenter/setting';// 个人中心/设置


  static void configureRoutes(Router router) {
    router.define(register, handler: registerHandler);
    router.define(teamList, handler: teamListHandler);
    router.define(extensionIncomeList, handler: extensionIncomeListHandler);
    router.define(share, handler: shareHandler);
    router.define(bounus, handler: bounusHandler);
    // router.define(message, handler: messageHandler);
    // router.define(wallet, handler: walletHandler);
    // router.define(partner, handler: partnerHandler);
    // router.define(inviteCode, handler: inviteCodeHandler);
    // router.define(certification, handler: certificationHandler);
    // router.define(help, handler: helpHandler);
    // router.define(setting, handler: settingHandler);
  }
}

// 注册页面handler
var registerHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

// 观光团/团队列表handler
var teamListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TeamList();
});

// 观光团/推广收益handler
var extensionIncomeListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ExtensionIncome();
});

// 观光团/推广收益handler
var shareHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SharePage();
});

// 个人中心/分红handler
var bounusHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BounusPage();
});

// 个人中心/消息handler
var messageHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MessagePage();
});

// 个人中心/钱包handler
var walletHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WalletPage();
});

// 个人中心/合伙人handler
var partnerHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PartnerPage();
});

// 个人中心/分红handler
var inviteCodeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return InviteCodePage();
});

// 个人中心/实名认证handler
var certificationHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CertificationPage();
});

// 个人中心/帮助中心handler
var helpHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HelpPage();
});
// 个人中心/设置handler
var settingHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingPage();
});

