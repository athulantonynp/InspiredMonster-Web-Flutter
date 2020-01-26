import 'package:flutter/material.dart';
import 'package:monster/models/shot.dart';

class ShotDetail extends StatefulWidget {
  Shot shot;
  ShotDetail({this.shot}) : super();

  @override
  _ShotDetailState createState() => _ShotDetailState();
}

class _ShotDetailState extends State<ShotDetail> {

  String followText='Follow me on Uplabs  | Twitter  | Facebook  | Instagram';
  @override
  Widget build(BuildContext context) {
    var imageWidth = getShotImageWidthForPreview(context);
    return Scaffold(
      body: Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(24),
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
              width: imageWidth,
              height: (imageWidth * 3) / 4,
              child:  Image.network(
                  widget.shot.images.two_x,
                  fit: BoxFit.fill,
              ),
            ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
                child: Text(
                  widget.shot.title,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).indicatorColor),
                      textAlign: TextAlign.left,
                      softWrap: false,

                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                removeAllHtmlTags(widget.shot.description),
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).indicatorColor),
              ),
            )
              ],
            ),
            )
          ],
        ),
      ),
    ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    String followLine="Follow";
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    var freeHtml=htmlText.replaceAll(exp, '');
    // var followIndex=htmlText.indexOf(followLine);

    // freeHtml=freeHtml.substring(0,followIndex);

    return freeHtml;
  }

  double getPadding(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
  }

  double getShotImageWidthForPreview(BuildContext context) {
    var maxwidth = MediaQuery.of(context).size.width;
    if (maxwidth > 800) {
      return 800;
    }

    if (maxwidth <= 800 && maxwidth > 400) {
      return 400;
    }

    if (maxwidth <= 400 && maxwidth > 200) {
      return 200;
    }

    if (maxwidth <= 200 && maxwidth > 100) {
      return 100;
    }

    return 50;
  }
}
