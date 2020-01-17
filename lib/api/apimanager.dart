import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:monster/models/shot.dart';

class ApiManager{
    Future<List<Shot>> getCurrentShots() async{
    var response = await http.get("https://us-central1-inspiredmonster-136b1.cloudfunctions.net/api/portfolios/");
    Iterable responseJson=json.decode(response.body);
    var list=responseJson.map((item)=> Shot.fromJson(item)).toList();
    list.sort((a,b) =>b.published_at.compareTo(a.published_at));
    return list;
  }
}