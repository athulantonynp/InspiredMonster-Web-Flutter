import 'package:flutter/material.dart';
import 'package:monster/utils/ColorUtils.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text("Home"),
      color: ColorUtils.fromHex("#ffffff"),
    );
  }

}