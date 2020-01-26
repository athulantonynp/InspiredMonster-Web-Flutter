import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monster/api/apimanager.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/screens/shotdetail.dart';
import 'package:monster/widgets/bottombar.dart';
import 'package:monster/widgets/herodialogroute.dart';

class Portfolio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PortfolioState();
  }
}

class PortfolioState extends State<Portfolio> {
  var ports = ApiManager().getCurrentShots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: getBodyContent(),
            flex: 13,
          ),
          Expanded(
            child: BottomBar(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget getBodyContent() {
    int count;

    if (MediaQuery.of(context).orientation == Orientation.landscape)
      count = 4;
    else
      count = 2;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: ports,
        builder: (BuildContext context, AsyncSnapshot<List<Shot>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 3, crossAxisCount: count),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  child: getShotCard(snapshot.data[index]),
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                );
              },
            );
          } else {
            return Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.white)),
              ),
            );
          }
        },
      ),
    );
  }

  Widget getShotCard(Shot shot) {
    return  InkWell(
        child: Image.network(
            shot.images.normal,
            fit: BoxFit.fill,
          ),
        onTap: () {
          Navigator.push(
              context,
              new HeroDialogRoute(
                  builder: (context) {
                    return ShotDetail(shot: shot);
                  },
                  colorBarrier: Theme.of(context).unselectedWidgetColor));
        }
    );
  }
}
