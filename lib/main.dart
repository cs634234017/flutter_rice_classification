import 'package:flutter/material.dart';
import 'package:flutter_rice_classification/bar/tabbar.dart';
import 'package:flutter_rice_classification/home.dart';
import 'package:flutter_rice_classification/page/predict.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Classification',
      home: MyBottomBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
