import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:monster/utils/ColorUtils.dart';

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
        color: Colors.black,
        height: 60.0,
        decoration: new BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: ColorUtils.fromHex("#181d24"),
              blurRadius: 20.0,
              spreadRadius: 1.0,
              offset: Offset(
                1.0,
                1.0,
              ),
            )
          ],
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Padding(
              child: Image.asset(getTitleIcon()),
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
            ),
            Padding(
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            ),
            
          ],
        ));
  }
}
