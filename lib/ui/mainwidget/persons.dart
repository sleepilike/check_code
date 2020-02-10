import 'package:flutter/material.dart';

import '../widget/card_item.dart';
import 'person.dart';

Widget buildTableCell(String label){
  return new Container(
    alignment: Alignment.center,
    child: new Text(
      label,
      textAlign: TextAlign.center,
    ),
  );
}
class Persons extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _PersonsState();
  }
}

class _PersonsState extends State<Persons>{

  Widget build (BuildContext context){
    return
      CardItem(
          title: "监控信息",
          child: SizedBox(
            height: 280,
            width: 200,
            child:Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: new EdgeInsets.all(2.0),
                  alignment: Alignment.center,
                  child:Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const<int,TableColumnWidth>{
                      0:FixedColumnWidth(30.0),
                      1:FixedColumnWidth(60.0),
                      2:FixedColumnWidth(30.0),
                      3:FixedColumnWidth(30.0),
                      4:FixedColumnWidth(90.0),
                      5:FixedColumnWidth(70.0),
                      6:FixedColumnWidth(70.0),
                    },
                    border: TableBorder.all(color: Colors.white),
                    children: <TableRow>[
                      new TableRow(
                        children: <Widget>[
                          new TableCell(child: buildTableCell("序号")),
                          new TableCell(child: buildTableCell("姓名")),
                          new TableCell(child: buildTableCell("年龄")),
                          new TableCell(child: buildTableCell("性别")),
                          new TableCell(child: buildTableCell("手机号码")),
                          new TableCell(child: buildTableCell("所处地点 ")),
                          new TableCell(child: buildTableCell("健康情况")),
                        ],
                      ),
                    ],
                  ) ,
                ),
                Expanded(
                  flex: 1,
                  child: PersonListView(),
                )

              ],
            ) ,)

      );


  }
}

