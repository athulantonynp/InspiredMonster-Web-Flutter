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
            child: getMainContent(context),
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

  bool isMobile(){
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return false;
    else
      return true;
  }

  Widget getMainContent(BuildContext context) {
    var size = getImageSize();
    return  ListView.builder(
      shrinkWrap:true,
          itemCount: 3,
          itemBuilder: (context, index) {
            if(index==0){
              return getHeadText(size);
            }
            if(index==1){
              return getAboutMeText();
            }

            if(index==2){
             return getResumeButton();
            }
            return Container();
          },
        );
  }

  double getImageSize() {
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return 160;
    else
      return 100;
  }

  Widget getHeadText(double size){
    return Padding(padding: EdgeInsets.fromLTRB(64, 32, 64, 12)
    ,
    child:  Row(
      mainAxisAlignment: isMobile()? MainAxisAlignment.start : MainAxisAlignment.center,
      children: <Widget>[
        getPortfolioIcon(size),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitle(),
            getSocialIcons()
          ],
        )
      ],
    ),);
  }

  Widget getAboutMeText(){
   return Padding(
            padding: EdgeInsets.fromLTRB(64, 32, 64, 64),
            child: Text(
              Utils.ABOUT_ME_TEXT,
              style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
              ),
              textAlign: isMobile()? TextAlign.left : TextAlign.center,
            ));
  }
  Widget getPortfolioIcon(double size){
    return  Image.asset(
          Utils.getImageForWeb("ic_dp.png"),
          fit: BoxFit.contain,
          width: size,
          height: size,
        );
  }

  Widget getTitle(){
    return  Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Text("Arun Sajeev",
                style: TextStyle(
                    color: Theme.of(context).indicatorColor, fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
            ));
  }


  Widget getSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 12, 0),
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
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: InkWell(
              onTap: (){Utils().launchURL("https://twitter.com/imarun949");},
              child: Image.asset(
                Utils.getImageForWeb("twitter.png"),
                width: 36,
                height: 36,
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
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

  Widget getResumeButton(){
    return Align(
      alignment: Alignment.center,
      child: Container(
      child: Padding(
                padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
                child: RaisedButton(
                  color: Theme.of(context).indicatorColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                  onPressed: () {
                    Utils().launchURL(
                        "https://drive.google.com/file/d/1zVnBR-cMfm2J4qQM62iRChynHD43kPu8/view?usp=sharing");
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(64, 14, 64, 14),
                    child: Text('Download Resume',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor)),
                  ),
                ),
              ),
    ),
    );
  }
}
