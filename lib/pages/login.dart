import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone;
  String password;
  String virifyCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('login')),
        body: Column(children: [
          InputBox(
              imgUrl: 'images/home.png', hint: '手机号码', onChanged: _changePhone),
          InputBox(
              imgUrl: 'images/home.png',
              hint: '请输入登录密码',
              onChanged: _changePass),
          InputBox(
              imgUrl: 'images/home.png',
              hint: '请输入验证码',
              onChanged: _changeCode),
          FlatButton(onPressed: (){
            print("${phone} ${password} ${virifyCode}");
          }, child: Text('登录'), color: Color(0xFF36C273), textColor: Color(0xFFFFFFFF),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            GestureDetector(
              onTap: (){

              },
              child: Text('注册新用户'),
            ),
            VerticalDivider(
              width: 20,
              thickness: 2,
              color: Colors.black,
              indent: 10,
              endIndent: 30,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Text('验证码登录'),
            )
          ],)
        ]));
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
}

class InputBox extends StatefulWidget {
  final String imgUrl;
  final String hint;
  final ValueChanged<String> onChanged;

  const InputBox({Key key, this.imgUrl, this.hint, this.onChanged})
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
        Image.asset(widget.imgUrl, width: 30.0, height: 30.0),
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
        Image.asset(widget.imgUrl, width: 30.0, height: 30.0),
      ]),
    );
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}
