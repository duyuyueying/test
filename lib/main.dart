import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoo/navigator/tab_navigator.dart';
import 'package:flutter_zoo/pages/login.dart';
import 'package:flutter_zoo/routes/routes.dart';
import 'package:provider/provider.dart';

import 'routes/application.dart';
import 'store/user_info.dart';
import 'util/rem.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserInfo())],
        child: MyApp()),
  );
  // 将Anroid头部的设置为导航栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    Rem.setDesignWidth(1125.0);
    return MaterialApp(
      home: showWelcomePage(context),
    );
  }
   showWelcomePage(BuildContext context) {
    String token = Provider.of<UserInfo>(context).token;
    // if (token == null) {
    //   return LoginPage();
    // } else {
      return TabNavigator();
    // }
  }
}
