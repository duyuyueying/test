import 'package:flutter/material.dart';
import 'package:flutter_zoo/util/rem.dart';

class TourTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            color: Color(0xFFF3F5F4),
            child: Container(
              color: Color(0xFF36C273),
              height: Rem.getPxToRem(595),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[Text('合成动物等级越高级'), Text('我的收入越高')],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      "images/home.png",
                      width: 80,
                      height: 80,
                    ),
                  )
                ],
              ),
            )),
        // Text('hahah'),
        Positioned(
          top: Rem.getPxToRem(426),
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(Rem.getPxToRem(47)),
            child: Container(
              height: 300,
              color: Colors.red,
              
            ),
          ),
        )
      ],
    ));
  }
}
