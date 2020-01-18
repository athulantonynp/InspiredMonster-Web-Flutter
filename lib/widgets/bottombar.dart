import 'package:flutter/material.dart';
import 'package:monster/utils/ColorUtils.dart';
import 'package:monster/utils/utils.dart';

class BottomBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomBarState();
  }

}

class BottomBarState extends State<BottomBar>{
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                  Text(
                    "© 2020 Inspired Monster",
                    style: TextStyle(color: ColorUtils.fromHex("#757575")),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: IconButton(
                    icon:
                        Image.asset(Utils.getImageForWeb("ic_mode_light.png"),height: 20,width: 20,),
                    onPressed: () {},
                  ),
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