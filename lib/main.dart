import 'package:flutter/material.dart';
import 'package:monster/screens/mainframe.dart';
import 'package:monster/utils/ThemeUtils.dart';
import 'package:monster/widgets/ThemeInheritedWidget.dart';

void main() => runApp(MonsterApp());

final themeBloc = ThemeBloc();

class MonsterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: themeBloc.darkEnabled,
      initialData: true,
      builder: (context, snapshot) {
        return ThemeInheritedWidget(
          themeBloc: themeBloc,
          child: MaterialApp(
              title: 'Inspired Monster',
              debugShowCheckedModeBanner: false,
              theme: snapshot.data
                  ? ThemeUtils().darkTheme
                  : ThemeUtils().lightTheme,
              home: new MainFrame()),
        );
      },
    );
  }
}




