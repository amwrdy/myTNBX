import 'package:fire_pay/constants/color_constant.dart';
import 'package:fire_pay/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: kAccentColor,
        backgroundColor: kBackgroundColor
      ),
      home: HomeScreen()
    );
  }
}
