import 'package:flutter/material.dart';
import 'package:monster/utils/utils.dart';
import 'package:monster/widgets/bottombar.dart';

class AboutMe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutMeState();
  }
}

class AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: getMainContent(),
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

  Widget getMainContent() {
    var size = getImageSize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(24),
            child: Text("About Me",
                style: TextStyle(
                    color: Theme.of(context).indicatorColor, fontSize: 20))),
        Image.asset(
          Utils.getImageForWeb("ic_dp.png"),
          fit: BoxFit.fill,
          width: size,
          height: size,
        ),
        Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "I enjoy taking complex problems and turning them into simple and" +
                  "beautiful interface designs. I know all the good design words and acronyms such as MVP, Design system" +
                  "Responsive design etc. When I’m not pushing pixels",
              style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            )),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: RaisedButton(
              color: Theme.of(context).buttonColor,
              shape:  RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(40.0)
),
            onPressed: (){
              Utils().launchURL("https://drive.google.com/file/d/1zVnBR-cMfm2J4qQM62iRChynHD43kPu8/view?usp=sharing");
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(64,14, 64, 14),
              child: Text('Download Resume', style: TextStyle(fontSize: 20,
            color: Theme.of(context).indicatorColor)),
            ),
          ),
              )
          ],
          ),
        )
      ],
    );
  }

  double getImageSize() {
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return 160;
    else
      return 80;
  }
}
