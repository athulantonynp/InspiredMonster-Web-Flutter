import 'package:flutter/material.dart';
import 'package:monster/api/apimanager.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/utils/ColorUtils.dart';
import 'package:monster/utils/utils.dart';
import 'package:monster/widgets/bottombar.dart';

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
      color: ColorUtils.fromHex("#121212"),
      child: FutureBuilder(
        future: ports,
        builder: (BuildContext context, AsyncSnapshot<List<Shot>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count),
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

}
