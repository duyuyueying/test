import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoo/pages/register.dart'; 

class Routes{
  static String register = '/register';

  static void configureRoutes(Router router) {
    router.define(register, handler: registerHandler, );
  }
}

var registerHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});