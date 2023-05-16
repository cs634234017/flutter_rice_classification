// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_rice_classification/predict.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 4), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => Home(),
//         ),
//       );
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green.shade200,
//       body: SizedBox(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Image(image: AssetImage("assets/icons/rice_logo.png"))
//           ],
//         ),
//       ),
//     );
//   }
// }
