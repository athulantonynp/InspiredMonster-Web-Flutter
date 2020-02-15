import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monster/utils/utils.dart';

class Credits extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
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
            Image.asset(Utils.getImageForWeb("close.png"),width: 40,height: 40,)
          ],
        )
      ],
    );
  }
}
