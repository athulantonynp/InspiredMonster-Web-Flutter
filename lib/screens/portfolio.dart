import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monster/api/apimanager.dart';
import 'package:monster/models/shot.dart';
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
            child: getBodyContent(context),
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

  Widget getBodyContent(BuildContext context) {
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
              padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      child: getShotCard(snapshot.data[index], context),
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    )
                  ],
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

  Widget buildDetailview(Shot shot, BuildContext context) {
    return  Container(
      height: double.infinity,
      width: double.infinity,
      child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 50,
        sigmaX: 50
      ),
      child:  AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content:  GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:  Hero(
            tag: shot.id.toString(),
            child:  Container(
              child: Image.network(
                shot.images.two_x,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  Card getShotCard(Shot shot, BuildContext context) {
    return Card(
      semanticContainer: true,
      color: Theme.of(context).primaryColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        child: Hero(
          tag: shot.id.toString(),
          child: Image.network(
            shot.images.normal,
            fit: BoxFit.fill,

          ),
        ),
        onTap: () {
          Navigator.push(context,
              new HeroDialogRoute(builder: (BuildContext context) {
            return buildDetailview(shot, context);
          }));
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
    );
  }
}
