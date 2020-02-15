import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:monster/utils/utils.dart';
import 'package:monster/widgets/bottombar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return getHomeContentMain(
              context, constraints.maxWidth, constraints.maxHeight);
        },
      ),
    );
  }

  Widget getHomeContentMain(BuildContext context, double width, double height) {
    var mainContainerHeight = getMainContainerHeight(height);
    var bottomBarHeight = getBottomBarHeight(height);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: mainContainerHeight,
          width: width,
          child: getBodyContent(context),
        ),
        Container(
          height: bottomBarHeight,
          width: width,
          child: BottomBar(showCredits: false,),
        )
      ],
    );
  }

  double getMainContainerHeight(double height) {
    if (height > 700) {
      return (height * 93) / 100;
    } else {
      return (height * 90) / 100;
    }
  }

  double getBottomBarHeight(double height) {
    if (height > 700) {
      return (height * 7) / 100;
    } else {
      return (height * 10) / 100;
    }
  }

  Widget getBodyContent(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: <Widget>[getBackground(context), getHomeContent(context)],
      ),
    );
  }

  Widget getHomeContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        getIntroText(context),
        getSocialIcons(context),
        Spacer(
          flex: 2,
        ),
        getImage(context),
        Spacer(
          flex: 1,
        )
      ],
    );
  }

  Widget getSocialIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 36, 0),
          child: InkWell(
            onTap: (){Utils().launchURL("https://dribbble.com/inspired_monster");},
            child: Image.asset(
              Utils.getImageForWeb("dribble.png"),
              width: 36,
              height: 36,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 36, 0),
            child: InkWell(
              onTap: (){Utils().launchURL("https://twitter.com/imarun949");},
              child: Image.asset(
                Utils.getImageForWeb("twitter.png"),
                width: 36,
                height: 36,
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 36, 0),
            child: InkWell(
              onTap: (){Utils().launchURL("https://in.linkedin.com/in/arunsajeev");},
              child: Image.asset(
                Utils.getImageForWeb("linkedin.png"),
                width: 36,
                height: 36,
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: InkWell(
              onTap: (){Utils().launchURL("https://www.instagram.com/inspired_monster/");},
              child: Image.asset(
                Utils.getImageForWeb("instagram.png"),
                width: 36,
                height: 36,
              ),
            )),
      ],
    );
  }

  Widget getImage(BuildContext context) {
    var responsiveWidth = getComputerWidth(MediaQuery.of(context).size.width);
    return Container(
      width: double.infinity,
      child: SizedBox(
        width: responsiveWidth,
        height: responsiveWidth,
        child: Image.asset(Utils.getImageForWeb("ic_computer.png")),
      ),
    );
  }

  double getComputerWidth(double width) {
    if (width < 600 && width > 400) {
      return 280;
    }
    if (width > 600 && width < 1000) {
      return 340;
    }
    if (width > 1000) {
      return 420;
    }
    if (width < 400) {
      return 220;
    }
    return 460;
  }

  Widget getIntroText(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
              style: TextStyle(color: Theme.of(context).indicatorColor),
              children: <TextSpan>[
                TextSpan(text: "I’m"),
                TextSpan(
                    text: " Arun Sajeev.",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        " A Product designer based in Kochi. Currently working at Entri, focused on"),
                TextSpan(
                    text: " User Experience ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "and"),
                TextSpan(
                    text: " Illustration.",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
        ),
      ),
    );
  }

  Widget getBackground(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            color:Theme.of(context).backgroundColor,
          ),
          flex: 7,
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).selectedRowColor,
          ),
          flex: 3,
        )
      ],
    );
  }
}
