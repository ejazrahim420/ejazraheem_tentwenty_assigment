import 'package:flutter/material.dart';
import 'package:movie_app/utils/style/style_util.dart';

Widget commonParentWidget({
  required double width,
  required Widget widgetChild,
  Widget? bottomNavBar,
  Widget? appBar,
  bool hasAppBarPadding = false,
  bool hasBodyPadding = false,
  bool hasStatusBarPadding = true,
}) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Container(
      color: MyStyle.secondaryColor,
      child: Column(
        children: [
          hasStatusBarPadding ? const TopOfAppBar() : const SizedBox(),
          // ----------------- App Bar

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: hasAppBarPadding ? MyStyle.paddingHorizontal : 0),
            child: appBar ?? const SizedBox(),
          ),
          // ----------------- Body
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: hasBodyPadding ? MyStyle.paddingHorizontal : 0),
            child: widgetChild,
          ),
          // ----------------- Navigation Bar
          bottomNavBar ?? const SizedBox(),
        ],
      ),
    ),
  );
}

class TopOfAppBar extends StatelessWidget {
  final Color color;
  const TopOfAppBar({
    Key? key,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: MediaQuery.of(context).padding.top,
    );
  }
}
