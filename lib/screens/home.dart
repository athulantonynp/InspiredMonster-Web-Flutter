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

    return Scaffold(
      backgroundColor: ColorUtils.fromHex("#212121"),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
         Container(
           height: ((MediaQuery.of(context).size.height*85)/100),
           color: Colors.red,
         ),

           Container(
           height:  ((MediaQuery.of(context).size.height*15)/100),
           color: Colors.blue,
         )
        
        ],
      ),
    );
  }

}