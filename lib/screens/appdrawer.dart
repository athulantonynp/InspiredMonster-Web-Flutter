import 'dart:js';
import 'package:flutter/material.dart';
import 'package:monster/screens/portfolio.dart';
import 'package:monster/screens/home.dart';

class AppDrawer {
  
  Drawer getDrawer(GlobalKey<NavigatorState> navigatorKey,BuildContext context) {
    return Drawer(
        
      child: Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: <Widget>[
           DrawerHeader(child: Container()),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: FlatButton(
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).indicatorColor,
              disabledColor: Colors.grey,
              disabledTextColor:Theme.of(context).indicatorColor,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
              onPressed: () {
                navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=> Home()));
                print(Navigator.pop(context));
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
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).indicatorColor,
              disabledColor: Colors.grey,
              disabledTextColor:Theme.of(context).indicatorColor,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
              onPressed: () {
                 
               navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=> Portfolio()));
               print(Navigator.pop(context));
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
