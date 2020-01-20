import 'package:flutter/material.dart';
import 'package:monster/models/shot.dart';
import 'package:monster/utils/ColorUtils.dart';

class ShotDetail extends StatefulWidget {
  Shot shot;

  ShotDetail({this.shot}) : super();

  @override
  _ShotDetailState createState() => _ShotDetailState();
}

class _ShotDetailState extends State<ShotDetail> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.blue,
        canvasColor: Colors.blue,
        backgroundColor: Colors.blue,
        scaffoldBackgroundColor: Colors.blue,
        accentColor: Colors.blue,
        dialogBackgroundColor: Colors.blue,
        splashColor: Colors.blue,
        primarySwatch: Colors.blue
      ),
      child: Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
      ),
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Hero(
            tag: widget.shot.id.toString(),
            child: Image.network(
              widget.shot.images.normal,
              fit: BoxFit.fill,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
    );
  }
}
