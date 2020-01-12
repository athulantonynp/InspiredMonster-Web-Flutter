import 'dart:js';
import 'package:flutter/material.dart';
import 'package:monster/screens/portfolio.dart';

import 'home.dart';

class AppDrawer {
  
  Drawer getDrawer(GlobalKey<NavigatorState> navigatorKey,BuildContext context) {
    return Drawer(
        
      child: Container(
      color: Colors.black,
      child: ListView(
        children: <Widget>[
           DrawerHeader(child: Container()),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: FlatButton(
              shape: StadiumBorder(),
              color: Colors.black,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
              onPressed: () {
                 
                navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=> Home()));
                Navigator.pop(context);
              },
              child: Text(
                "Home",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

        Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: FlatButton(
              shape: StadiumBorder(),
              color: Colors.black,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
              onPressed: () {
                 
               navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=> Portfolio()));
               Navigator.pop(context);
              },
              child: Text(
                "Portfolio",
                style: TextStyle(fontSize: 14),
              ),
            ),
          )

        ],
      ),
    ));
  }
}
