
import 'package:flutter/material.dart';
import 'package:registration_admin/config/const.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(LOGO, width: 60, height: 60,),
        Text(
          "  广东省农业科学院\n防疫信息系统",
          style: new TextStyle(fontSize: 30,fontWeight: FontWeight.w700),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}