import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:piko/core/resources/res_color.dart';
import 'package:piko/feature/home_screen.dart';
import 'package:piko/core/resources/res_text_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Piko',
      theme: getAppLightTheme(),
      logWriterCallback: (text, {isError}) {
        print(text);
      },
      // debugShowCheckedModeBanner: false, // TODO: remove banner
      home: HomeScreen(),
      builder: (BuildContext context, Widget child) {
        /// make sure that loading can be displayed in front of all other widgets
        return FlutterEasyLoading(child: child);
      },
    );
  }

  ThemeData getAppLightTheme() {
    return ThemeData(
      primaryColor: ResColor.darkBlue,
      accentColor: ResColor.lightOrange,
      primaryColorDark: ResColor.lightBlue,
      appBarTheme: getAppBarTheme(),
      textTheme: GoogleFonts.robotoTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  AppBarTheme getAppBarTheme() {
    return AppBarTheme(
      color: ResColor.lightGrey,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: ResColor.darkBlue),
      textTheme: TextTheme(headline6: ResTextStyle.appBarTitle),
    );
  }
}
