import 'package:flutter/material.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/utils/ColorUtils.dart';

class ShotDetail extends StatefulWidget{

  Shot shot;
  
  ShotDetail({this.shot}):super();

  @override
  _ShotDetailState createState() => _ShotDetailState();
}

class _ShotDetailState extends State<ShotDetail> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: ColorUtils.fromHex("#59000000"),
      child: GestureDetector(
        child: Padding(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Hero(
        tag: widget.shot.id.toString(),
        child: Image.network(
            widget.shot.images.normal,
            fit: BoxFit.none,
          ),
      ),
      ),
      onTap: (){
        Navigator.pop(context);
      },
      ),
    );
  }
}