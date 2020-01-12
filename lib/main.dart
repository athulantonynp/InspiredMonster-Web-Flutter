import 'package:flutter/material.dart';
import 'package:monster/screens/home.dart';
import 'package:monster/screens/portfolio.dart';
import 'package:monster/utils/ColorUtils.dart';
import 'package:monster/widgets/monsterbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspired Monster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorUtils.primaryBlack,
      ),
      home: new Scaffold(
        appBar: MonsterBar(),
        backgroundColor: ColorUtils.fromHex("#212121")
      )
    );
  }
}
