import 'package:flutter/material.dart';
import 'package:monster/utils/ColorUtils.dart';

class Portfolio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PortfolioState();
  }

}

class PortfolioState extends State<Portfolio>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text("Portfolio"),
    );
  }

}
