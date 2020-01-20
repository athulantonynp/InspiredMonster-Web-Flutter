import 'package:flutter/material.dart';
import 'package:monster/screens/home.dart';
import 'package:monster/screens/portfolio.dart';
import 'package:monster/widgets/monsterbar.dart';
class MainFrame extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() {
    return MainFrameState();
  }
}

class MainFrameState extends State<MainFrame>{
   final navigatorKey = GlobalKey<NavigatorState>();
     int _selectedDrawerIndex = 0;

   @override
  Widget build(BuildContext context) {
    return new Scaffold(
        
        appBar: MonsterBar(),
        backgroundColor: Colors.transparent,
        endDrawer: getDrawer(context),
        body:_getDrawerItemWidget(_selectedDrawerIndex));
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Home();
      case 1:
        return new Portfolio();

      default:
        return new Text("Error");
    }
  }

    Drawer getDrawer(BuildContext context) {
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
                setState(() {
                  _onSelectItem(0);
                });
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
                setState(() {
                  _onSelectItem(1);
                });
              
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

