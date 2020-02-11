import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_admin/config/const.dart';
import 'package:registration_admin/data/monitor_state_model.dart';
import 'package:registration_admin/data/user_state_model.dart';
import 'package:registration_admin/ui/dialog/condition_dialog.dart';
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
      body: Consumer<UserStateModel>(
        builder: (BuildContext context, UserStateModel value, Widget child) {
          int adminId = value.user.adminId;
          return ChangeNotifierProvider<MonitorStateModel>( // 注册监控信息状态管理器
            create: (BuildContext context) =>
                MonitorStateModel()..init(adminId, value.user.role),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 0,
                    child: Padding(
                      padding: new EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            LOGO,
                            width: 45.0,
                            height: 45.0,
                          ),
                          Text(
                            " 广东省农业科学院防疫信息系统",
                            style: Theme.of(context).textTheme.title,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
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
        },
      ),
    );
  }

  _buildButtonGroup() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ButtonBar(
          children: <Widget>[
            Consumer<MonitorStateModel>(builder: (BuildContext context, MonitorStateModel value, Widget child) {
              return RaisedButton(
                child: Text(
                  "定制表格",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFF087f23),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ConditionDialog(value.requestEntity, (res) {
                          value.refreshData(res).then((value) => BotToast.showText(text: '数据更新成功'))
                              .catchError((error) => BotToast.showText(text: '数据更新失败，' + error.toString()));
                        }, institutes: value.institutes,);
                      });
                },
              );
            },),
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
        ));
  }
}
