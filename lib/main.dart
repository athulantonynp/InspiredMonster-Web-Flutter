import 'package:flutter/material.dart';
import 'package:monster/screens/appdrawer.dart';
import 'package:monster/screens/home.dart';
import 'package:monster/utils/ColorUtils.dart';
import 'package:monster/widgets/monsterbar.dart';

void main() => runApp(MonsterApp());

class MonsterApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspired Monster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorUtils.primaryBlack,
        fontFamily: 'Roboto'
      ),

      home: new MainFrame()
    );
  }
}

class MainFrame extends StatelessWidget{
    final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: MonsterBar(),
        backgroundColor: ColorUtils.fromHex("#212121"),
        endDrawer: AppDrawer().getDrawer(navigatorKey, context),
        body:   Container(
          child:new  Navigator(key: navigatorKey,
              onGenerateRoute: (route)=>MaterialPageRoute(
                settings: route,
                builder: (context)=> Home()
              ),),
        )
      );
  }

}
