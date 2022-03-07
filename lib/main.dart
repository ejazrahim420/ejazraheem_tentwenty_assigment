import 'package:flutter/material.dart';
import 'package:movie_app/utils/route_controller/route_controller.dart';
import 'package:movie_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class NoGlowScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteController.controller,
      initialRoute: RouteController.homeScreen,
      scrollBehavior: NoGlowScrollBehaviour(),
      home: HomeScreen(),
    );
  }
}
