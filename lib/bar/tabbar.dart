import 'package:flutter/material.dart';
import 'package:flutter_rice_classification/page/manual.dart';
import 'package:flutter_rice_classification/page/prediction.dart';
import 'package:flutter_rice_classification/page/ricepanicle.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Predict(),
    const Manual(),
    RicePanicle(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        centerTitle: true,
        title: const Text('Rice Classification'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Prediction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Manual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grain),
            label: 'Rice',
          ),
        ],
      ),
    );
  }
}
