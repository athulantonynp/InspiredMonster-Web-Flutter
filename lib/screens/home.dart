import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:monster/utils/ColorUtils.dart';
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
      backgroundColor: ColorUtils.fromHex("#212121"),
      body:LayoutBuilder(
        builder: (context,constraints){
          return getHomeContentMain(context, constraints.maxWidth, constraints.maxHeight);
        },
      ) ,
    );
  }

  Widget getHomeContentMain(BuildContext context,double width,double height){
    var mainContainerHeight=getMainContainerHeight(height);
    var bottomBarHeight=getBottomBarHeight(height);
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
            width:width,
            child:BottomBar(),
          )
      ],
    );
  }

  double getMainContainerHeight(double height){
    if(height>700){
         return (height*93)/100;
    }else{
      return (height*90)/100;
    }
   
  }

  double getBottomBarHeight(double height){
    if(height>700){
       return (height*7)/100;
    }else{
       return (height*10)/100;
    }
   
  }


  Widget getBodyContent(BuildContext context){
    return Container(
              color: ColorUtils.fromHex("#121212"),
              child: Stack(
                children: <Widget>[
                    getBackground(),
                    getHomeContent(context)

                ],
              ),
    );
  }

  Widget getHomeContent(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
           getIntroText(),
           getSocialIcons(context),
           Container(
             height: (MediaQuery.of(context).size.height*17)/100,
           ),
         getImage(context)
      ],
    );
  }


  Widget getSocialIcons(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 36, 0),
            child: InkWell(
            child: Image.asset(Utils.getImageForWeb("dribble.png"),width: 36,height: 36,),
          ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 36, 0),
            child: InkWell(
            child: Image.asset(Utils.getImageForWeb("twitter.png"),width: 36,height: 36,),
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 36, 0),
            child: InkWell(
            child: Image.asset(Utils.getImageForWeb("linkedin.png"),width: 36,height: 36,),
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: InkWell(
            child: Image.asset(Utils.getImageForWeb("instagram.png"),width: 36,height: 36,),
          )),
      ],
    );
  }

  Widget getImage(BuildContext context){
    var responsiveWidth=getComputerWidth(MediaQuery.of(context).size.width);
    return  Container(
      width: double.infinity,
      child:  SizedBox(
      width: responsiveWidth,
      height:responsiveWidth,
      child:  Image.asset(Utils.getImageForWeb("ic_computer.png")),
    ),
    );
  }

  double getComputerWidth(double width){
    
    if(width<600 && width>400){
        return 260;
    }
    if(width>600 && width<1000){
        return 320;
    }
    if(width>1000){
      return 400;
    }
    if(width<400){
      return 200;
    }
    return 460;
  }


  Widget getIntroText(){
    return Container(
      width: double.infinity,
      child:  Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: RichText(
        textAlign: TextAlign.center,
      text: new TextSpan(
        style: TextStyle(color: Colors.white),
        children: <TextSpan>[
          TextSpan(text: "I’m"),
          TextSpan(text: " Arun Sajeev.",style: TextStyle(fontWeight: FontWeight.bold)),
           TextSpan(text: " A Product designer based in Kochi. Currently working at Entri, focused on"),
            TextSpan(text: " User Experience ",style: TextStyle(fontWeight: FontWeight.bold)),
             TextSpan(text: "and"),
              TextSpan(text: " Illustration.",style: TextStyle(fontWeight: FontWeight.bold))
        ]
      ),
    ),
    ),
    );
  }

  Widget getBackground(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(color: ColorUtils.fromHex("#121212"),),
          flex: 7,
        ),
        Expanded(
          child: Container(color: ColorUtils.fromHex("#181818"),),
          flex: 3,
        )
      ],
    );
  }


}
