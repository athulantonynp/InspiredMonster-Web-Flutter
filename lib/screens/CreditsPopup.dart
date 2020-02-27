import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monster/screens/credits.dart';

class CreditsPopup extends ModalRoute{
  Color bgColor;


  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor =>
      bgColor == null ? Colors.black.withOpacity(0.5) : bgColor;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        type: MaterialType.transparency,
        child:  _buildOverlayContent(context),
      ),
    );
  }
  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      child: Credits(),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}