import 'package:flutter/material.dart';
import 'package:monster/widgets/bottombar.dart';

class AboutMe extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AboutMeState();
  }

}

class AboutMeState extends State<AboutMe>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(),
            flex: 13,
          ),
          Expanded(
            child: BottomBar(),
            flex: 1,
          ),
        ],
      ),
    );
  }

}