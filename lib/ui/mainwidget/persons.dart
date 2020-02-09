import 'package:flutter/material.dart';
import 'package:registration_staff/ui/mainwidget/person.dart';
import 'package:registration_staff/ui/widget/card_item.dart';

class Persons extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _PersonsState();
  }
}

class _PersonsState extends State<Persons>{

  Widget build (BuildContext context){
    return CardItem(
        title: "监控信息",
        child: SizedBox(
          height: 270,
          width: 200,
          child:Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "序号  姓名   年龄   性别  手机号码    所处地点   健康情况",
                style: new TextStyle(
                    color: Colors.black
                ),
              ),
              PersonListView()
            ],
          ) ,)

    );
  }
}