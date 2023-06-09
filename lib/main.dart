import 'package:flutter/material.dart';
import 'package:flutter_rice_classification/bar/tabbar.dart';
import 'package:flutter_rice_classification/page/prediction.dart';
import 'package:flutter_rice_classification/page/splash_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animal Classification',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
