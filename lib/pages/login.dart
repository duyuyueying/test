import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoo/http/api.dart';
import 'package:flutter_zoo/pages/register.dart';
import 'package:flutter_zoo/routes/application.dart';
import 'package:flutter_zoo/store/user_info.dart';
import 'package:flutter_zoo/util/rem.dart';
import 'package:flutter_zoo/util/verify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone;
  String password;
  String verifyCode;
  bool isAgreeRules = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  InputBox(
                      imgUrl: 'images/home.png',
                      hint: '手机号码',
                      onChanged: _changePhone),
                  InputBox(
                      imgUrl: 'images/home.png',
                      hint: '请输入登录密码',
                      onChanged: _changePass),
                  InputBox(
                      imgUrl: 'images/home.png',
                      hint: '请输入验证码',
                      onChanged: _changeCode,
                      rightWidget: Text('我是右边数据')),
                  _renderLoginBtn(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _tapText('注册新用户', callback: () {
                        Application.router.navigateTo(context, "/register",
                            transition: TransitionType.inFromRight);
                      }, size: 14),
                      _tapText('验证码登录', size: 14)
                    ],
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _renderCheckbox(),
                      _tapText('登录即代表您同意', fontColor: "BDBFBE"),
                      _tapText('《用户服务协议》', fontColor: "36C273"),
                      _tapText('《隐私政策》', fontColor: "36C273"),
                    ],
                  ),
                )
              ]),
        ));
  }

  void _changePhone(String value) {
    setState(() {
      phone = value;
    });
  }

  void _changePass(String value) {
    setState(() {
      password = value;
    });
  }

  void _changeCode(String value) {
    setState(() {
      verifyCode = value;
    });
  }

  // 登录按钮
  _renderLoginBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 40),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: Rem.getPxToRem(138)),
        child: FlatButton(
          onPressed: () {
            // _doLogin();
            Provider.of<UserInfo>(context).changeToken('456');
          },
          child: Text(
            '登录',
            style: TextStyle(fontSize: Rem.getPxToRem(45)),
          ),
          color: Color(0xFF36C273),
          textColor: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
        ),
      ),
    );
  }

  // 可点击的text
  _tapText(String title,
      {Function callback, double size = 12, String fontColor = "0C1911"}) {
    return GestureDetector(
        onTap: () {
          if (callback != null) {
            callback();
          }
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: size, color: Color(int.parse('0xFF${fontColor}'))),
        ));
  }

  // 复选框
  _renderCheckbox() {
    return GestureDetector(
        onTap: () {
          setState(() {
            isAgreeRules = !isAgreeRules;
          });
        },
        child: isAgreeRules
            ? Icon(
                Icons.check_box,
                size: 14,
                color: Color(0xFF36C273),
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: 14,
                color: Color(0xFF36C273),
              ));
  }

  void _doLogin() async {
    if (phone == '' || phone == null) {
      Fluttertoast.showToast(msg: '请输入您的手机号！');
      return;
    }
    if (!Verify.isPhoneNumber(phone)) {
      Fluttertoast.showToast(msg: '请输入正确的手机号！');
      return;
    }
    if (verifyCode == '' || verifyCode == null) {
      Fluttertoast.showToast(msg: '请输入您的验证码！');
      return;
    }
    if (password == '' || password == null) {
      Fluttertoast.showToast(msg: '请输入您的密码！');
      return;
    }

    var options = {
      "mobile": phone,
      "password": password,
      "verify_code": verifyCode
    };
    final Response response = await Api.postLogin(options);
    if (response.statusCode == 200) {
      var token = response.data.token;
      // 存储到storer
      Provider.of<UserInfo>(context).changeToken(token);
      // mutations.setApiToken(token);
      Fluttertoast.showToast(msg: '登录成功');
      // setTimeout(()=>{
      // 	uni.reLaunch({
      // 		url: '/pages/index/index'
      // 	})
      // }, 1500)
    } else {
      verifyCode = null;
      // this.getVerifyCode();
      Fluttertoast.showToast(msg: response.data.msg);
    }
  }
}

// input的封装
class InputBox extends StatefulWidget {
  final String imgUrl;
  final String hint;
  final ValueChanged<String> onChanged;
  final Widget rightWidget;

  const InputBox(
      {Key key, this.imgUrl, this.hint, this.onChanged, this.rightWidget})
      : super(key: key);
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Rem.getPxToRem(180),
      margin: EdgeInsets.fromLTRB(Rem.getPxToRem(98), 0, Rem.getPxToRem(98), 0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFEBECEB), width: 0.5))),
      child: Row(children: [
        Image.asset(widget.imgUrl, width: 30.0, height: 30.0),
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: _onChanged,
            autofocus: false,
            style: TextStyle(
                fontSize: Rem.getPxToRem(40),
                color: Colors.black,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
                fillColor: Colors.red,
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: InputBorder.none,
                hintText: widget.hint ?? '',
                hintStyle: TextStyle(
                    fontSize: Rem.getPxToRem(40), color: Color(0xFFDADDDB))),
          ),
        ),
        widget.rightWidget != null ? widget.rightWidget : Container(),
      ]),
    );
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}
