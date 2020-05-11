import 'package:flutter/material.dart';
import 'package:flutter_zoo/store/user_info.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String phone;
  String password;
  String virifyCode;
  bool isAgreeRules = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                      _tapText('注册新用户', () {}),
                      VerticalDivider(
                        width: 1.0,
                        color: Colors.red,
                      ),
                      _tapText('验证码登录', () {})
                    ],
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _renderCheckbox(),
                      _tapText('登录即代表您同意', null),
                      _tapText('《用户服务协议》', null),
                      _tapText('《隐私政策》', null),
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
      virifyCode = value;
    });
  }

  // 登录按钮
  _renderLoginBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 40),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 46.0),
        child: FlatButton(
          onPressed: () {
            Provider.of<UserInfo>(context).changeToken('456');
          },
          child: Text('登录'),
          color: Color(0xFF36C273),
          textColor: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
        ),
      ),
    );
  }

  // 可点击的text
  _tapText(String title, Function onClick) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 12),
      ),
    );
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
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFEBECEB), width: 0.5))),
      child: Row(children: [
        // Image.asset(widget.imgUrl, width: 30.0, height: 30.0),
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: _onChanged,
            autofocus: false,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w300),
            decoration: InputDecoration(
                fillColor: Colors.red,
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: InputBorder.none,
                hintText: widget.hint ?? '',
                hintStyle: TextStyle(fontSize: 12, color: Color(0xFFDADDDB))),
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
