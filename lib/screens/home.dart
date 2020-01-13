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
          
         Expanded(
           child: Container(color: Colors.white,),
           flex: 12,
         ),

          Expanded(
           child: getFooter(context),
           flex: 1,
         ),
        
        ],
      ),
    );
  }

  Widget getFooter(BuildContext context){
    return Container(
      color: Colors.black,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
          Container(
            height: 2,
            color: ColorUtils.fromHex("#212121"),
          ),
          Row(
            children: <Widget>[
              Expanded(
            child:
              Align(
                alignment: Alignment.center,
                child: Text("© 2020 Inspired Monster",style: TextStyle(color:ColorUtils.fromHex("#757575")),),
              )
            ,
            flex: 9,
          ),
          Expanded(
            child:Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ), onPressed: () {},
          
          ),
            ),
          flex: 0,
          )
            ],
          )
      ],
    ),
    );
  }

}