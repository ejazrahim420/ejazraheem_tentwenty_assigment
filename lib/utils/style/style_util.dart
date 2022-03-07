import 'package:flutter/material.dart';

abstract class MyStyle {
  static printm(var val) {
    // ignore: avoid_print
    print("-------- =  $val");
  }

  static const double svgHeight = 20;
  static const double buttonHeight = 55;
  static const Color buttonColorBlue = Color(0xff61c3f2);

  static const double fontSize0 = 12;
  static const double fontSize1 = 16;
  static const double fontSize2 = 20;
  static const double fontSize3 = 24;
  static const double textHeight = 1.2;

  static const double borderRadius0 = 5.0;
  static const double borderRadius1 = 10.0;
  static const double borderRadius2 = 20.0;
  static const double borderThickness = 1.5;

  static const double textFieldHeight = 55;

  static const double paddingHorizontal = 16;
  static const double paddingHorizontalDouble = 32;

  static const double bottomNavbarHeight = 66;
  static const double appBarHeight = 56;

  static const double contentPaddingHorizontal = 16;
  static const double contentPaddingVertical = 16;

  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Colors.black;

  static const Color primaryColor = Color(0xff2e2739);
  static const Color secondaryColor = Color(0xfff6f6fa);
  static const Color colorGrey = Color(0xffdbdbdf);

  static const Color textColorWhite = Colors.white;
  static const Color textColorDark = Color(0xff202c43);
  static const Color textColorGrey = Color(0xff808080);

  static const Color cursorColor = colorBlack;

  static bool isSmallPhoneByHeight(BuildContext context) {
    return MediaQuery.of(context).size.height <= 670;
  }

  static TextStyle textStyle1({
    required BuildContext context,
    FontWeight weight = FontWeight.normal,
    Color color = textColorDark,
    double fontSize = fontSize1,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
      fontFamily: "Poppins",
    );
  }

  static Text text0({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextDirection? textDirection,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    double fontSize = fontSize0,
    double? height,
  }) {
    return Text(
      text,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          decoration: textDecoration,
          fontFamily: "Poppins",
          color: color ?? textColorDark,
          fontWeight: weight),
    );
  }

  static Text text1({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextDirection? textDirection,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    double fontSize = fontSize1,
    double? height,
  }) {
    return Text(
      text,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          decoration: textDecoration,
          fontFamily: "Poppins",
          color: color ?? textColorDark,
          fontWeight: weight),
    );
  }

  static Text text2({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextDirection? textDirection,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    double fontSize = fontSize2,
    double? height,
  }) {
    return Text(
      text,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          decoration: textDecoration,
          fontFamily: "Poppins",
          color: color ?? textColorDark,
          fontWeight: weight),
    );
  }

  static Text text3({
    required String text,
    FontWeight weight = FontWeight.normal,
    Color? color,
    int? maxLines,
    TextOverflow? overflow,
    TextDirection? textDirection,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    double fontSize = fontSize3,
    double? height,
  }) {
    return Text(
      text,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          decoration: textDecoration,
          fontFamily: "Poppins",
          color: color ?? textColorDark,
          fontWeight: weight),
    );
  }

  static double getWidth(
      {required BuildContext context, bool hasPadding = false}) {
    return hasPadding
        ? MediaQuery.of(context).size.width - (paddingHorizontal * 2)
        : MediaQuery.of(context).size.width;
  }

  static double getHeight(
      {required BuildContext context,
      required bool hasNavBar,
      required bool hasAppBar}) {
    double _navBarHeight = 0;
    double _appBarHeight = 0;

    if (hasNavBar) {
      _navBarHeight = bottomNavbarHeight;
    }
    if (hasAppBar) {
      _appBarHeight = appBarHeight;
    }

    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        _navBarHeight -
        _appBarHeight;
  }
}
