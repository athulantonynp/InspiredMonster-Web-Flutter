import 'package:flutter/material.dart';
import 'package:monster/theme/ColorUtils.dart';
import 'package:monster/widgets/monsterbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspired Monster',
      theme: ThemeData(
        primarySwatch: ColorUtils.primaryBlack,
      ),
      home: new Scaffold(
        appBar: MonsterBar(),
      ),
    );
  }
}
