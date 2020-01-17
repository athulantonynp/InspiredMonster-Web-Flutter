import 'package:flutter/material.dart';
import 'package:monster/api/apimanager.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/utils/ColorUtils.dart';
import 'package:monster/utils/utils.dart';

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
      backgroundColor: ColorUtils.fromHex("#212121"),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: getBodyContent(context),
            flex: 13,
          ),
          Expanded(
            child: getFooter(context),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget getBodyContent(BuildContext context) {
    return Container(
      color: ColorUtils.fromHex("#121212"),
      child: FutureBuilder(
        future: ports,
        builder: (BuildContext context, AsyncSnapshot<List<Shot>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      child: getShotCard(snapshot.data[index]),
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    )
                  ],
                );
              },
            );
          } else {
            return SizedBox(
                height: 300.0,
                width: 300.0,
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 5.0));
          }
        },
      ),
    );
  }

  Card getShotCard(Shot shot) {
    return Card(
      semanticContainer: true,
      color: Colors.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: <Widget>[
          Image.network(
            shot.images.normal,
            fit: BoxFit.fill,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 3,
    );
  }

  Widget getFooter(BuildContext context) {
    return Container(
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
                  child: IconButton(
                    icon:
                        Image.asset(Utils.getImageForWeb("ic_mode_light.png")),
                    onPressed: () {},
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
