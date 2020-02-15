import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monster/utils/utils.dart';

class Credits extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.fromLTRB(16, 24, 0, 24),
          decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: new BorderRadius.all(Radius.circular(16))),
          child:SingleChildScrollView(
            child: getCreditsContent(context),
          )
    );
  }

  Widget getCreditsContent(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Credits',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).indicatorColor,fontWeight: FontWeight.w500)),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
              child: Image.asset(Utils.getImageForWeb("close.png"),width: 40,height: 40),
            )
          ],
        ),

       Padding(
         padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
         child:  Text('Special Thanks to',
             style: TextStyle(
                 fontSize: 16,
                 color: Theme.of(context).indicatorColor,fontWeight: FontWeight.w500)),
       ),
        getCreditItem("💻", "Athul Antony for developing this website pixel perfectly", context),
        getCreditItem("🎧", " Spotify for the music playlist widget", context),
        getCreditItem("😀", "Emojipedia for beautiful, free emoji’s", context),
        getCreditItem("🏀", "Dribbble for the shots listing API", context),

        Padding(
          padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
          child:  Text('Featured In',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).indicatorColor,fontWeight: FontWeight.w500)),
        ),

        getCreditItem("🌐", "Itsallwidgets.com-An open list of apps built with Flutter", context),
      ],
    );
  }

  Widget getCreditItem(String icon, String text,BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 16, 0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            icon,style: TextStyle(fontSize: 16,color:Theme.of(context).indicatorColor),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8,0, 16, 0),
            child: Text(
                text,style: TextStyle(fontSize: 16,color:Theme.of(context).indicatorColor),overflow: TextOverflow.ellipsis,),
            ) 
          ],
      ),
    );
  }
}
