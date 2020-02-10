import 'package:flutter/material.dart';
import 'package:registration_admin/config/const.dart';
import 'package:registration_admin/ui/dialog/yuan.dart';
import 'package:registration_admin/ui/mainwidget/imformation.dart';
import 'package:registration_admin/ui/mainwidget/persons.dart';

class MainPageBranch extends StatefulWidget {
  @override
  _MainPageBranchState createState() => _MainPageBranchState();
}

class _MainPageBranchState extends State<MainPageBranch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 0,
              child:  Padding(
                padding: new EdgeInsets.all(25.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Image.asset(
                      LOGO,
                      width: 45.0,
                      height: 45.0,
                    ),
                    Text(
                      " 广东省农业科学院防疫信息系统",
                      style: Theme
                          .of(context)
                          .textTheme
                          .title,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child:Column(
                children: <Widget>[
                  Information(),
                  SizedBox(
                    height: 4,
                  ),
                  Persons(),
                  SizedBox(
                    height: 4,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 0,
              child: _buildButtonGroup(),
            )
          ],
        ),
      ),
    );
  }

  _buildButtonGroup() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text(
                "定制表格",
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF087f23),
              onPressed: () {
                showDialog(
                    context: context,
                  builder: (context){
                      return YuanDialog();
                  }
                );
              },
            ),
            SizedBox(
              width: 20,
            ),
            RaisedButton(
              elevation: 4,
              child: Text(
                "导出",
                style: Theme.of(context).textTheme.button,
              ),
              color: Color(0xFF087f23),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
          ],
        )
    );
  }
}
