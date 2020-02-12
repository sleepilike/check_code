import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:registration_admin/config/const.dart';

/// 返回时间格式'2019-10-10'
class DateSpinner extends StatefulWidget {
  DataCallback callback;
  String init;
  String label;
  DateSpinner(this.label, this.init, this.callback, {Key key}): super(key:key);

  @override
  _DateSpinnerState createState() => _DateSpinnerState(label, init, callback);
}

class _DateSpinnerState extends State<DateSpinner> {

  DataCallback callback;
  String _dateString;
  String label;

  _DateSpinnerState(this.label, this._dateString, this.callback);

  _showDatePicker () async{
    var result = await showDatePicker(
        context:context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100)
    );

    if (result != null) {
      setState(() {
        _dateString = formatDate(result, [yyyy,"-",mm,"-",dd,""]);
      });
      callback(_dateString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    label,
                    style: TEXT_STYLE_LABEL,
                  ),
                ],
              ),
              InkWell(
                child: Row(
                  children: <Widget>[
                    Text(_dateString,
                      style: TEXT_STYLE_LABEL,),
                    Icon(Icons.arrow_drop_down,color: Colors.grey,)
                  ],
                ),
                onTap: this._showDatePicker,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
