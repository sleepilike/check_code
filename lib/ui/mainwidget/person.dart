import 'package:flutter/material.dart';

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
                SizedBox(
                  width: 30,
                ),
                Text(
                  "$index"
                ),
                new Expanded(
                    child:PersonPrint(persons[index])
                )

              ],
            );
          }),
    );

  }
}

class PersonPrint extends StatelessWidget{

  final Person aperson;
  PersonPrint(this.aperson);

  Widget build (BuildContext context){
    return new Row(
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.all(15.0),
          child:Text(
              aperson.name
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(6.0),
          child:Text(
              aperson.age
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(2.0),
          child:Text(
              aperson.sex
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(2.0),
          child:Text(
              aperson.tel
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(2.0),
          child:Text(
              aperson.address
          ),
        ),
        Padding(
          padding: new EdgeInsets.all(10),
          child:Text(
              aperson.health
          ),
        ),
      ],
    );
  }
}