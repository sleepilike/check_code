import 'package:flutter/material.dart';
import 'package:registration_staff/ui/widget/card_item.dart';

class Imformation extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _ImformationState();
  }
}

class _ImformationState extends State<Imformation>{

  Widget build (BuildContext context){
    return CardItem(
        title: "单位信息",
        child: SizedBox(
          height: 150,
          width: 200,
          child: Column(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.all(7),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "机构名称：",
                      style: new TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    new Text(
                      "广东省农业科学院农业经济与农村发展研究所",
                      style: new TextStyle(
                          fontSize: 14
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
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      new Text(
                        "曹阳",
                        style: new TextStyle(
                            fontSize: 15
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
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      new Text(
                        "108人",
                        style: new TextStyle(
                            fontSize: 15
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
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      new Text(
                        "3人次",
                        style: new TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ],
                  )

              ),
            ],
          ),
        ),
    );
  }
}