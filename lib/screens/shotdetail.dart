
import 'package:flutter/material.dart';
import 'package:monster/models/shot.dart';


Widget getShotDetailWidget(Shot shot,BuildContext context){
  return SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
       SizedBox(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.width*0.3,
         child: Hero(
            tag: shot.id.toString(),
            child:  
            Image.network(
                shot.images.two_x,
                fit: BoxFit.fill
            ),
          ),
       ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 8),
          child: Text(shot.title,style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).indicatorColor
        ),),
        ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: Text(removeAllHtmlTags(shot.description),style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).indicatorColor
        ),),
        )
    ],
  ),
  );
}


String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }