import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/utils/utils.dart';

class ShotDetail extends StatefulWidget {

  Shot shot;
  List<Shot> shots;
  int index;
  ShotDetail({this.shot,this.shots,this.index}) : super();

  @override
  _ShotDetailState createState() => _ShotDetailState();
}

class _ShotDetailState extends State<ShotDetail> {

  @override
  Widget build(BuildContext context) {

    var slider=buildCarousel(widget,context);

    return Scaffold(
      body:  Column(
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

   CarouselSlider buildCarousel(ShotDetail widget,BuildContext context){
    var imageWidth = getShotImageWidthForPreview(context);
    return CarouselSlider.builder(
        itemCount: widget.shots.length,
        aspectRatio: MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      initialPage: widget.index,
      itemBuilder: (BuildContext context, int itemIndex) =>

          Container(
            width: imageWidth,
              height:(imageWidth * 3) / 4,
              child: Stack(
                alignment:Alignment.center,
                children: <Widget>[
                  Center(
                      child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).indicatorColor)
                  )),
                  Image.network(

                    widget.shots[itemIndex].images.two_x,
                    fit: BoxFit.fill,
                    width: imageWidth,
                    height: (imageWidth * 3) / 4,
                  )
                ],
              ),
            )
    );
  }



  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    var freeHtml = htmlText.replaceAll(exp, '');
    return freeHtml;
  }

  static double getShotImageWidthForPreview(BuildContext context) {
    var maxwidth = MediaQuery.of(context).size.width;
    if (maxwidth > 800) {
      return 800;
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

    return 50;
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
            child: RotatedBox(quarterTurns: 2,child: Image.asset(Utils.getImageForWeb("ic_forward.png")),),
            onTap: (){
              setState(() {
                slider.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);

              });
            },
          ),
         InkWell(
           child:  Image.asset(Utils.getImageForWeb("ic_close.png")),
           onTap: (){Navigator.of(context).pop();},
         ),
          InkWell(
            child: Image.asset(Utils.getImageForWeb("ic_forward.png")),
            onTap: (){
              setState(() {
                slider.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
              });
            },
          )
        ],
      ),
    );
  }


/*  Center(
  child: Container(
  width: imageWidth,
  child: ListView(
  shrinkWrap: true,
  padding: EdgeInsets.all(24),
  children: <Widget>[
  Align(
  alignment: Alignment.center,
  child: Container(
  width: imageWidth,
  height: (imageWidth * 3) / 4,
  child:Stack(
  children: <Widget>[
  Center(child: CircularProgressIndicator(
  valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).indicatorColor)
  )),
  Image.network(
  widget.shot.images.two_x,
  fit: BoxFit.fill,
  )
  ],
  ),
  ),
  ),
  Align(
  alignment: Alignment.centerLeft,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
  Align(
  alignment: Alignment.centerLeft,
  child: Padding(
  padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
  child: Text(
  widget.shot.title,
  style: TextStyle(
  fontSize: 20,
  color: Theme.of(context).indicatorColor),
  textAlign: TextAlign.left,
  softWrap: false,
  ),
  ),
  ),
  Align(
  alignment: Alignment.centerLeft,
  child: Text(
  removeAllHtmlTags(widget.shot.description),
  style: TextStyle(
  fontSize: 14,
  color: Theme.of(context).indicatorColor),
  ),
  )
  ],
  ),
  )
  ],
  ),
  ),
  )*/
}
