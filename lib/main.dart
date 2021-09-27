import 'package:flutter/material.dart';
import 'package:pedometer_demo/screen/pedometer_screen/pedometer_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pedometer Demo',
      debugShowCheckedModeBanner: false,
      home: PedometerHome(),
    );
  }
}
