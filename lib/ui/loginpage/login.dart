
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:registration_staff/ui/mainpage/mainpage.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}
class _LoginPageState extends State<LoginPage> {
  var leftRighthRadding = 30.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _userPassController = new TextEditingController();
  var _useNameController = new TextEditingController();

  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.all(25.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        "https://bkimg.cdn.bcebos.com/pic/dc54564e9258d109906ce9d5dc58ccbf6d814dcd?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg",
                        width: 30.0,
                        height: 30.0,
                      ),
                      Text(
                        "  广东省农业科学院防疫信息系统",
                        style: Theme
                            .of(context)
                            .textTheme
                            .title,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(
                      leftRighthRadding, 50.0, leftRighthRadding, 10.0
                  ),
                  child: Row(
                      children: <Widget>[
                        Padding(
                          padding: new EdgeInsets.fromLTRB(
                              70.0, 50.0, 0.0, 10.0
                          ),
                          child: Icon(Icons.person),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(
                              10.0, 50.0, leftRighthRadding, 10.0
                          ),
                          child: Text(
                            "管理员登录",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0
                            ),
                          ),
                        )
                      ]) ,
                ),


                Padding(
                  padding: new EdgeInsets.fromLTRB(
                      leftRighthRadding, 50.0, leftRighthRadding,
                      topBottomPadding),
                  child: TextField(
                    style: hintTips,
                    controller: _useNameController,
                    decoration: new InputDecoration(hintText: "请输入用户名"),
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(
                      leftRighthRadding, 50.0, leftRighthRadding,
                      topBottomPadding),
                  child: TextField(
                    style: hintTips,
                    controller: _userPassController,
                    decoration: new InputDecoration(hintText: "请输入密码"),
                    obscureText: true,
                  ),
                ),
                Container(
                  width: 360.0,
                  margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                  padding: new EdgeInsets.fromLTRB(
                      leftRighthRadding, topBottomPadding, leftRighthRadding,
                      topBottomPadding),
                  child: new Card(
                    color: Colors.green,
                    elevation: 6.0,
                    child: new FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>MainPage())
                          );
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(10.00),
                          child: new Text(
                            "登录",
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                            ),
                          ),
                        )
                    ),
                  ),
                )
              ]
          ),
        )

    );
  }
}
