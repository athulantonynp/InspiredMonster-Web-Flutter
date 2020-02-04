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

  Widget getMainContent(BuildContext context) {
    var size = getImageSize();
    return  ListView.builder(
      shrinkWrap:true,
          itemCount: 4,
          itemBuilder: (context, index) {
            if(index==0){
              return getTitle();
            }
            if(index==1){
              return getPortfolioIcon(size);
            }
            if(index==2){
              return getAboutMeText();
            }

            if(index==3){
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
      return 80;
  }

  Widget getAboutMeText(){
   return Padding(
            padding: EdgeInsets.all(64),
            child: Text(
              Utils.ABOUT_ME_TEXT,
              style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
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
            padding: EdgeInsets.all(24),
            child: Text("About Me",
                style: TextStyle(
                    color: Theme.of(context).indicatorColor, fontSize: 20),textAlign: TextAlign.center,));
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
