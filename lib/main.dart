import 'package:Dozer/core/app_pages.dart';
import 'package:Dozer/homePage.dart';

import 'package:Dozer/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return  GetMaterialApp(
          title: 'Flutter Rent House APP',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: backgroundColor,
            primaryColor: primaryColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: accentColor,
            ),
            textTheme: TextTheme(
              headline1: TextStyle(color: headline1Color),
              bodyText1: TextStyle(color: bodyText1Color),
            ),
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes
        );
      },
    );
  }
}
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PageContainer()),
      );
    });
    final logoImage = Image.asset('assets/images/logo.png');
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 144, 13, 1.0),
      body: Center(
        child: logoImage,
      ),
    );
  }
}