import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

class Utils {
  static getImageForWeb(String name) {
    if (kReleaseMode) {
      return "web/assets/" + name;
    } else {
      return name;
    }
  }

  launchURL(String url) async {
    if (await UrlLauncherPlugin().canLaunch(url)) {
      await UrlLauncherPlugin().launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String ABOUT_ME_TEXT="I am a multidisciplinary designer obsessed with solving problems through rendering user needs to design solutions. "
      "I focus on User Experience and Interaction Design for digital products in bridging the gaps between users and their goals, all the while balancing business"
      " values and good experiences.\n\nHaving worked with India2 Startups and communities, I am skilled at following agile, communicating stakeholder needs, and cross-functional collaboration."
      " I am now the Head of Product Design at Entri.";

  static isMobileView(BuildContext context){
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return false;
    else
      return true;
  }

  static var aspectRatioWidthsSixteenNine=[40,160,256,320,384,400,512,640,800,832];
}
