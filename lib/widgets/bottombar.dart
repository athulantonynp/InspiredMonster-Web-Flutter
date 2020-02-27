import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monster/screens/CreditsPopup.dart';
import 'package:monster/utils/utils.dart';
import 'package:monster/widgets/ThemeInheritedWidget.dart';

class BottomBar extends StatefulWidget{

  final bool showCredits;

  BottomBar({Key key, @required this.showCredits}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return BottomBarState();
  }

}

class BottomBarState extends State<BottomBar>{
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
            height: 1,
            color: Theme.of(context).primaryColor,
          ),
          flex: 1,
          ),
         Expanded(
           child:  Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "© 2020 Inspired Monster",
                    style: TextStyle(color: Theme.of(context).indicatorColor),
                    textAlign: TextAlign.center,
                  ),

                 widget.showCredits ? getCreditsWidget() : Container()
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
                        Image.asset(Utils.getImageForWeb(
                          ThemeInheritedWidget.of(context).themeBloc.isDarkEnabled ?"ic_mode_light.png" : "ic_night_mode.png"),height: 30,width: 30,),
                    onPressed: () {
                      setState(() {
                      ThemeInheritedWidget.of(context).themeBloc.changeTheme;
                      });
                    },
                  ),
                  ),
                ),
              )
            ],
          ),
          flex: 99,
         )
        ],
      ),
    );
  }


  Widget getCreditsWidget() {
    return InkWell(
      onTap: (){
        Navigator.push(context, CreditsPopup());
      },
      child:Text(
        "    ·  Credits",
        style: TextStyle(color: Theme.of(context).indicatorColor),
        textAlign: TextAlign.center,
      ) ,
    );
    
  }

}
