import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_admin/data/user_state_model.dart';
import 'package:registration_admin/entity/user_entity.dart';

import '../widget/card_item.dart';

class Information extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _InformationState();
  }
}

class _InformationState extends State<Information>{

  Widget build (BuildContext context){
    return CardItem(
        title: "单位信息",
        child: Consumer<UserStateModel>(builder: (BuildContext context, UserStateModel value, Widget child) {
          UserEntity user = value.user;
          return Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: new EdgeInsets.all(7),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "机构名称：",
                          style: new TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        new Text(
                          user.institute,
                          style: new TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    )

                ),
                Padding(
                    padding: new EdgeInsets.all(7),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "信息管理：",
                          style: new TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        new Text(
                          user.adminName,
                          style: new TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    )

                ),
                Padding(
                    padding: new EdgeInsets.all(7),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "职工人数：",
                          style: new TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        new Text(
                          "${user.staffNum}人",
                          style: new TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    )

                ),
                Padding(
                    padding: new EdgeInsets.all(7),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "今日填报：",
                          style: new TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        new Text(
                          "${user.fillNum}人次",
                          style: new TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ],
                    )

                ),
              ],
            ),
          );
        },),
    );
  }
}