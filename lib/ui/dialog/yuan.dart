
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YuanDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            width: 350.0,
            height: 300.0,
            child: Column(
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
                Divider(),
                Radio(),
                MaterialButton(
                  child: new Text('请选择导出时间范围'),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
                      lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
                    ).then((DateTime val) {
                      print(val);
                    }).catchError((err) {
                      print(err);
                    });
                  },
                ),
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
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

enum Charge { yuan, suo }

class Radio extends StatefulWidget {
  @override
  _RadioState createState() => new _RadioState();
}

class _RadioState extends State<Radio> {
  Charge _charge= Charge.yuan;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: <Widget>[
              RadioListTile<Charge>(
                value: Charge.yuan,
                title: Text('院'),
                groupValue: _charge,
                activeColor: Colors.green,
                onChanged: (Charge value) {
                  print(value);
                  setState(() {
                    _charge = value;
                  });
                },
              ),
              RadioListTile<Charge>(
                value: Charge.suo,
                title: Text('所'),
                groupValue: _charge,
                activeColor: Colors.green,
                onChanged: (Charge value) {
                  print(value);
                  setState(() {
                    _charge = value;
                  });
                },
              )
            ]
        )
    );
  }
}