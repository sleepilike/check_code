import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_admin/common/check.dart';
import 'package:registration_admin/entity/institue_entity.dart';
import 'package:registration_admin/entity/monitor_request_entity.dart';
import 'package:registration_admin/ui/widget/date_spinner.dart';
import 'package:smart_select/smart_select.dart';

/// 定制表格的条件筛选框
typedef ConditionCallback = Function(MonitorRequestEntity);

class ConditionDialog extends Dialog {
  MonitorRequestEntity _entity;
  ConditionCallback _callback;
  List<InstituteEntity> institutes = [];
  List<int> values = [];

  ConditionDialog(this._entity, this._callback, {this.institutes, this.values});

  @override
  Widget build(BuildContext context) {
    return _ConditionWidget(
      _entity,
      _callback,
      institutes: institutes,
      values: values,
    );
  }
}

class _ConditionWidget extends StatefulWidget {
  MonitorRequestEntity _entity;
  ConditionCallback _callback;
  List<InstituteEntity> institutes = [];
  List<int> values = [];

  bool get showInstitutes => listNoEmpty(institutes);

  _ConditionWidget(this._entity, this._callback,
      {this.institutes, this.values});

  @override
  _ConditionState createState() => new _ConditionState(values);
}

class _ConditionState extends State<_ConditionWidget> {
  List<int> values = [];

  _ConditionState(this.values);

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
                    Text("(日期选择通过滑动翻页)"),
                  ],
                ),
                Visibility(
                  visible: widget.showInstitutes,
                  child: Column(
                    children: <Widget>[
                      SmartSelect<int>.multiple(
                          value: values,
                          title: '选择机构',
                          leading: Icon(Icons.assistant_photo),
                          options:
                              SmartSelectOption.listFrom<int, InstituteEntity>(
                                  source: widget.institutes,
                                  value:
                                      (index, item) => widget.institutes[index]
                                          .instituteSchoolId,
                                  title: (index, item) =>
                                      widget.institutes[index].instituteName),
                          onChange: (v) {
                            // 更新ui
                            setState(() {
                              values = v;
                              widget._entity.selectedIds = values;
                            });
                          }),
                      Divider(
                        color: Colors.black,
                        height: 4,
                      )
                    ],
                  ),
                ),
                DateSpinner("起始时间", widget._entity.startTime,
                    (res) => widget._entity.startTime = res),
                Divider(
                  color: Colors.black,
                  height: 4,
                ),
                DateSpinner("结束时间", widget._entity.endTime,
                    (res) => widget._entity.endTime = res),
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
                        widget._callback(widget._entity);
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
