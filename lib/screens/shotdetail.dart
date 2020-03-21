import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/utils/utils.dart';

class ShotDetail extends StatefulWidget {
  Shot shot;
  List<Shot> shots;
  int index;

  ShotDetail({this.shot, this.shots, this.index}) : super();

  @override
  _ShotDetailState createState() => _ShotDetailState();
}

class _ShotDetailState extends State<ShotDetail> {
  @override
  Widget build(BuildContext context) {
    var slider = buildCarousel(widget, context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: slider,
            flex: 13,
          ),
          Expanded(
            child: renderControlls(slider),
            flex: 1,
          ),
        ],
      ),
    );
  }

  CarouselSlider buildCarousel(ShotDetail widget, BuildContext context) {
    var fullwidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    var imageWidth = getShotImageWidthForPreview(context);

    return CarouselSlider.builder(
        height: fullHeight,
        itemCount: widget.shots.length,
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        initialPage: widget.index,
        itemBuilder: (BuildContext context, int itemIndex) => Container(
              margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
              padding: EdgeInsets.all(0),
              child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: imageWidth,
                          height: (imageWidth * 3) / 4,
                          child: Stack(
                            children: <Widget>[
                              Center(
                                  child: CircularProgressIndicator(
                                      valueColor:
                                      new AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).indicatorColor))),
                              Image.network(
                                widget.shots[itemIndex].images.two_x,
                                fit: BoxFit.fill,
                                width: imageWidth,
                                height: (imageWidth * 3) / 4,
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
                            child: Text(
                              widget.shots[itemIndex].title,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).indicatorColor),
                              textAlign: TextAlign.left,
                              softWrap: false,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            width: imageWidth,
                            child: Text(
                              removeAllHtmlTags(
                                  widget.shots[itemIndex].description),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).indicatorColor),
                            ),
                          ),
                        )
                      ]),
              ),
            ));
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    var freeHtml = htmlText.replaceAll(exp, '');
    return freeHtml;
  }

  static double getShotImageWidthForPreview(BuildContext context) {
    var maxwidth = MediaQuery.of(context).size.width;
    print(maxwidth);
    if (maxwidth > 800 && maxwidth < 1100) {
      return 700;
    }

    if (maxwidth <= 800 && maxwidth > 400) {
      return 400;
    }

    if (maxwidth <= 400 && maxwidth > 350) {
      return 350;
    }
    if (maxwidth <= 350 && maxwidth > 300) {
      return 300;
    }
    if (maxwidth <= 300 && maxwidth > 250) {
      return 250;
    }
    if (maxwidth <= 250 && maxwidth > 200) {
      return 200;
    }
    if (maxwidth <= 200 && maxwidth > 150) {
      return 150;
    }

    if (maxwidth <= 150 && maxwidth > 100) {
      return 100;
    }

    return 800;
  }

  renderControlls(CarouselSlider slider) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(Utils.getImageForWeb("ic_forward.png")),
            ),
            onTap: () {
              setState(() {
                slider.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              });
            },
          ),
          InkWell(
            child: Image.asset(Utils.getImageForWeb("ic_close.png")),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          InkWell(
            child: Image.asset(Utils.getImageForWeb("ic_forward.png")),
            onTap: () {
              setState(() {
                slider.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              });
            },
          )
        ],
      ),
    );
  }
}
