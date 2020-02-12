import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_admin/common/check.dart';
import 'package:registration_admin/config/const.dart';
import 'package:registration_admin/entity/institue_entity.dart';
import 'package:registration_admin/entity/monitor_request_entity.dart';
import 'package:registration_admin/ui/widget/date_spinner.dart';

/// 定制表格的条件筛选框
typedef ConditionCallback = Function(MonitorRequestEntity);
class ConditionDialog extends Dialog {
  MonitorRequestEntity _entity;
  ConditionCallback _callback;
  List<InstituteEntity> institutes;

  ConditionDialog(this._entity, this._callback, {this.institutes});
  bool get showInstitutes => listNoEmpty(institutes);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            width: double.infinity,
            height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("定制表格", style: Theme.of(context).textTheme.title),
                    SizedBox(width: 190.0),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                Visibility(
                  visible: showInstitutes,
                  child: Container(), /// todo 机构选择框
                ),
                DateSpinner("起始时间", _entity.startTime, (res) => _entity.startTime = res),
                DateSpinner("结束时间", _entity.endTime, (res) => _entity.endTime = res),
                //SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "取消",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF087f23),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 100.0),
                    RaisedButton(
                      child: Text("确定", style: TextStyle(color: Colors.white)),
                      color: Color(0xFF087f23),
                      onPressed: () {
                        _callback(_entity);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class Radio extends StatefulWidget {
  @override
  _RadioState createState() => new _RadioState();
}

class _RadioState extends State<Radio> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
    ]));
  }
}
