import 'package:flutter/foundation.dart';

class Utils{

  static getImageForWeb(String name){
     if(kReleaseMode){ 
          return "web/assets/"+name;
        } else {
            return name;
        }
  }
}