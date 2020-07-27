// main.dart

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:good_sprout/screens/root/root_screen.dart';
import 'package:good_sprout/services/auth.dart';
import 'constants.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Good sprout',
        home: new RootScreen(auth: new Auth()),
        theme: ThemeData(
            scaffoldBackgroundColor: lightGreenColor,
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontFamily: primaryFont,
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: primaryFont,
              ),
              headline5: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: primaryFont,
              ),
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: primaryFont,
              ),
              bodyText2: TextStyle(
                  color: darkGreenColor,
                  fontSize: 16.5,
                  fontFamily: primaryFont,
                  fontWeight: FontWeight.bold),
            )));
  }
}
