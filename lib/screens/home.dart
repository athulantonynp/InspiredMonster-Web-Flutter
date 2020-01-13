import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monster/utils/ColorUtils.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.fromHex("#212121"),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:getBodyContent(context) ,
            flex: 13,
          ),
          Expanded(
            child: getFooter(context),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget getBodyContent(BuildContext context){
    return Container(
              color: ColorUtils.fromHex("#121212"),
              child: Stack(
                children: <Widget>[
                    getBackground(),
                    getHomeContent()

                ],
              ),
    );
  }

  Widget getHomeContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
          getIntroText()
      ],
    );
  }

  Widget getIntroText(){
    return Container(
      width: double.infinity,
      child:  Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: RichText(
        textAlign: TextAlign.center,
      text: new TextSpan(
        style: TextStyle(color: Colors.white),
        children: <TextSpan>[
          TextSpan(text: "I’m"),
          TextSpan(text: " Arun Sajeev.",style: TextStyle(fontWeight: FontWeight.bold)),
           TextSpan(text: " A Product designer based in Kochi. Currently working at Entri, focused on"),
            TextSpan(text: " User Experience ",style: TextStyle(fontWeight: FontWeight.bold)),
             TextSpan(text: "and"),
              TextSpan(text: " Illustration.",style: TextStyle(fontWeight: FontWeight.bold))
        ]
      ),
    ),
    ),
    );
  }

  Widget getBackground(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(color: ColorUtils.fromHex("#121212"),),
          flex: 7,
        ),
        Expanded(
          child: Container(color: ColorUtils.fromHex("#181818"),),
          flex: 3,
        )
      ],
    );
  }

  Widget getFooter(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 1,
            color: ColorUtils.fromHex("#212121"),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text( "© 2020 Inspired Monster", style: TextStyle(color: ColorUtils.fromHex("#757575")),
                textAlign: TextAlign.center,)
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
