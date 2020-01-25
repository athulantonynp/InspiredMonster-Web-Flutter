import 'package:flutter/material.dart';

class HeroDialogRoute<T> extends PageRoute<T> {
  final Color colorBarrier;

  HeroDialogRoute({ this.builder,this.colorBarrier }) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => colorBarrier;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return new FadeTransition(
      opacity: new CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut
      ),
      child: child
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String get barrierLabel => "null";

}