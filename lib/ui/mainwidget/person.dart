import 'package:flutter/material.dart';

import 'persons.dart';
class Person {
  final String name;
  final String age;
  final String sex;
  final String tel;
  final String address;
  final String health;
  Person(
      this.name,this.age,this.sex,this.tel,this.address,this.health
      );
}

class PersonListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _PersonListViewState();
  }
}

class _PersonListViewState extends State<PersonListView>{
  final  persons=[
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
    Person("胖虎","10","男","12345678912","广东广州","均无"),
  ];
  Widget build (BuildContext context){
    return SizedBox(
      height: 240,
      child: ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context,index){
            return new Row(
              children: <Widget>[
                new Expanded(
                    child:PersonPrint(index,persons[index])
                )

              ],
            );
          }),
    );

  }
}

class PersonPrint extends StatelessWidget{

   int num;
   Person aperson;
   String snum;
  PersonPrint(num,aperson){
    this.aperson=aperson;
    this.snum=(num+1).toString();
  }

  Widget build (BuildContext context){
    return new Container(
      padding: new EdgeInsets.all(2.0),
      alignment: Alignment.center,
      child:Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: new TableBorder.all(color: Colors.white),
        columnWidths: const<int,TableColumnWidth>{
          0:FixedColumnWidth(30.0),
          1:FixedColumnWidth(60.0),
          2:FixedColumnWidth(30.0),
          3:FixedColumnWidth(30.0),
          4:FixedColumnWidth(90.0),
          5:FixedColumnWidth(70.0),
          6:FixedColumnWidth(70.0),
        },
        children: <TableRow>[
          new TableRow(
            children: <Widget>[
              new TableCell(child: buildTableCell(snum)),
              new TableCell(child: buildTableCell(aperson.name)),
              new TableCell(child: buildTableCell(aperson.age)),
              new TableCell(child: buildTableCell(aperson.sex)),
              new TableCell(child: buildTableCell(aperson.tel)),
              new TableCell(child: buildTableCell(aperson.address)),
              new TableCell(child: buildTableCell(aperson.health)),
            ],
          ),
        ],
      ) ,
    );
  }
}