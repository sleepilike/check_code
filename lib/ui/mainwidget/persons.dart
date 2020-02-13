import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_admin/data/monitor_state_model.dart';
import 'package:registration_admin/entity/worker_entity.dart';
import 'package:registration_admin/ui/widget/non_register_widget.dart';

import '../widget/card_item.dart';

class Persons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PersonsState();
  }
}

class _PersonsState extends State<Persons> {
  int showLen = 0; // 显示的数量
  bool isOverflow = false;

  Widget build(BuildContext context) {
    return CardItem(
        title: "监控信息",
        child: Consumer<MonitorStateModel>(
          builder:
              (BuildContext context, MonitorStateModel value, Widget child) {
            List<WorkerEntity> resultList = value.resultList;
            // 避免溢出，
            showLen = value.isRegister? ((isOverflow = resultList.length > 10)?
            10: resultList.length): 0;
            return Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: new EdgeInsets.all(2.0),
                    alignment: Alignment.center,
                    child: value.isRegister? Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      border: TableBorder.all(color: Colors.white),
                      children: _buildTableRowList(resultList, showLen),
                    ): NonRegisterWidget(),
                  ),
                  Align( // 查看全部按钮
                    alignment: Alignment.centerRight,
                    child: Visibility(
                        visible: isOverflow,
                        child: Container(
                          child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  isOverflow = false;
                                  showLen = resultList.length;
                                });
                              },
                              child: Text(
                                '查看全部',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                    color: Theme.of(context).primaryColor),
                              )),
                        )),
                  )
                ],
              ),
            );
          },
        ));
  }

  List<TableRow> _buildTableRowList(List<WorkerEntity> resultList, int showLen) {
    List<TableRow> rowList = List();
    rowList.add(_buildTableHeader("姓名", "所处地点", "健康情况", "接触者\n健康状况"));
    for (int i = 0; i < showLen; i++) {
      WorkerEntity worker = resultList[i];
      rowList.add(_buildRowItem(worker.workerName, worker.workerCurAdd, worker.status, worker.closeStatus));
    }
    return rowList;
  }

  TableRow _buildRowItem(name, location, health, closeHealth) {
    return new TableRow(
      children: <Widget>[
        new TableCell(child: buildTableCell(label: name)),
        new TableCell(child: buildTableCell(label: location)),
        new TableCell(child: buildTableCell(label: health)),
        new TableCell(child: buildTableCell(label: closeHealth)),
      ],
    );
  }

  Widget buildTableCell({label, style}) {
    return new Container(
      alignment: Alignment.center,
      child: new Text(label??'', // 如果label为null，就置空
          textAlign: TextAlign.center,
          style: style == null ? Theme.of(context).textTheme.bodyText2 : style),
    );
  }

  TableRow _buildTableHeader(name, location, health, closeHealth) {
    TextStyle headerStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(color: Theme.of(context).primaryColorDark);
    return TableRow(
      children: <Widget>[
        new TableCell(child: buildTableCell(label: name, style: headerStyle)),
        new TableCell(
            child: buildTableCell(label: location, style: headerStyle)),
        new TableCell(child: buildTableCell(label: health, style: headerStyle)),
        new TableCell(
            child: buildTableCell(label: closeHealth, style: headerStyle)),
      ],
    );
  }
}
