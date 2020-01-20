import 'package:flutter/foundation.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

class Utils{

  static getImageForWeb(String name){
     if(kReleaseMode){ 
          return "web/assets/"+name;
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
}