import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rice_classification/home.dart';
import 'package:flutter_rice_classification/page/manual.dart';
import 'package:flutter_rice_classification/page/predict.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
                text: 'Prediction',
              ),
              Tab(
                icon: Icon(Icons.menu_book_rounded),
                text: 'Manual',
              ),
            ],
          ),
          title: Text('Rice Classification'),
        ),
        body: TabBarView(
          children: [
            Predict(),
            Manual(),
          ],
        ),
      ),
    );
  }
}
