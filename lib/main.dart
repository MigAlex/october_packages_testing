import 'package:flutter/material.dart';
import 'package:october_2020_practise_1/custom_widgets/custom_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primaryColor: Colors.white
      ),
      home: HomeAnimationCC(),
    );
  }
}
