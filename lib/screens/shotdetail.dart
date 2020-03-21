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
    var isMobile=Utils.isMobileView(context);
    var marginWidth=(fullwidth-imageWidth)/2;
    return CarouselSlider.builder(
        height: fullHeight,
        itemCount: widget.shots.length,
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
        initialPage: widget.index,
        itemBuilder: (BuildContext context, int itemIndex) => Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: EdgeInsets.all(0),
              child: SingleChildScrollView(
                    child:Container(
                      width: imageWidth,
                      height: fullHeight,
                      child:  Column(
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
                                    fit: BoxFit.contain,
                                    width: imageWidth,
                                    height: (imageWidth * 3) /4,
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
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
                              alignment: isMobile? Alignment.center : Alignment.centerLeft  ,
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
    //print(maxwidth);
    var totalSize=Utils.aspectRatioWidthsSixteenNine.length;
    if(maxwidth<=800){
      return maxwidth-40.toDouble();
    }else{
      return 800.toDouble();
    }

  /*  double returnWidth=800;

    for(int i=0;i<totalSize;i++){
      var leastIndex=Utils.aspectRatioWidthsSixteenNine[i];
      var nextIndex=-1;
      if(i!=totalSize-1){
        nextIndex=Utils.aspectRatioWidthsSixteenNine[i+1];
      }

      if(nextIndex!=-1){
          if(maxwidth>leastIndex && maxwidth<nextIndex){
            returnWidth=leastIndex.toDouble();
            break;

          }
      }else{
        returnWidth=leastIndex.toDouble();
      }
    }
    return returnWidth;*/
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
