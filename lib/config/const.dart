import 'package:flutter/material.dart';

const appBarColor = Color(0xff4169e2);

const Color fixedColor = Colors.blue;

const bgColor = Color(0xfff7f7f7);

const mainSpace = 10.0;

const mainLineWidth = 0.3;

const lineColor = Colors.grey;

const mainTextColor = Color.fromRGBO(115, 115, 115, 1.0);

const LOGO = 'assets/logo.jpeg';
const String STATUS_NOTHING = '均无';
const String STATUS_COUGH = '咳嗽';
const String STATUS_FEVER = '发热';
const String STATUS_COLD = '感冒';
const String STATUS_SUSPECT_ILL = '疑似新冠肺炎';
const String STATUS_CONFIRM_ILL = '确诊新冠肺炎';

const TextStyle TEXT_STYLE_LABEL = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w500
);

typedef DataCallback = void Function(String);
