import 'package:flutter/material.dart';
import 'package:monster/utils/ColorUtils.dart';
import 'package:monster/utils/utils.dart';

class Portfolio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PortfolioState();
  }

}

class PortfolioState extends State<Portfolio>{
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
                  
                ],
              ),
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
                    icon: Image.asset(Utils.getImageForWeb("ic_mode_light.png")),
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
