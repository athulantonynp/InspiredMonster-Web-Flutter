import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:monster/utils/utils.dart';
import 'package:monster/widgets/ThemeInheritedWidget.dart';

class MonsterBar extends StatefulWidget implements PreferredSizeWidget {
  MonsterBar({Key key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  MonsterBarState createState() => MonsterBarState();
}

class MonsterBarState extends State<MonsterBar> {
  String getTitleIcon() {
    if (kReleaseMode) {
      return "web/assets/im_main.png";
    } else {
      return "im_main.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      
        height: 60.0,
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).bottomAppBarColor,
              blurRadius: 10.0,
              spreadRadius: 0.5,
              offset: Offset(
                0,
                0.5,
              ),
            )
          ],
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Padding(
              child: Image.asset(getTitleIcon()),
              padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            ),
            Padding(
              child: InkWell(
                child:Image.asset(Utils.getImageForWeb( 
                  ThemeInheritedWidget.of(context).themeBloc.isDarkEnabled ?"ic_menu.png" : "ic_menu_light_v2.png")),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                }
              ) ,
              
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            ),
            
          ],
        ));
  }
}
