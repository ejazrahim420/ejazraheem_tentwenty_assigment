import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/utils/const/assets_const.dart';
import 'package:movie_app/utils/style/style_util.dart';

//typedef void MyCallbackBottomNavBar(int index);
typedef MyCallbackBottomNavBar = void Function(int index);

class BottomNavBarOfMainApp extends StatelessWidget {
  const BottomNavBarOfMainApp({
    Key? key,
    required this.width,
    required this.height,
    required this.onItemClick,
    required this.selectedIndex,
  }) : super(key: key);
  final MyCallbackBottomNavBar onItemClick;
  final double width;
  final double height;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    // yahan bottom padding bhe 12 ha or bottom k container ki height se vhe me 12 minus kra hu
    // yh important ha
    const double bottomPad = 0;
    const double svgHeight = 20;
    return Container(
      decoration: const BoxDecoration(
        color: MyStyle.primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(MyStyle.borderRadius2),
            topLeft: Radius.circular(MyStyle.borderRadius2)),
      ),
      width: width,
      height: MyStyle.bottomNavbarHeight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: bottomPad),
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                onItemClick(0);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    MyAssetsConst.dashboardSvg,
                    height: svgHeight,
                    color: selectedIndex == 0
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyStyle.text0(
                    fontSize: 10,
                    text: "Dashboard",
                    color: selectedIndex == 0
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  )
                ],
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                onItemClick(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    MyAssetsConst.watchSvg,
                    height: svgHeight,
                    color: selectedIndex == 1
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyStyle.text0(
                    fontSize: 10,
                    text: "Watch",
                    color: selectedIndex == 1
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  )
                ],
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                onItemClick(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    MyAssetsConst.mediaSvg,
                    height: svgHeight,
                    color: selectedIndex == 2
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyStyle.text0(
                    fontSize: 10,
                    text: "Media Library",
                    color: selectedIndex == 2
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  )
                ],
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                onItemClick(3);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    MyAssetsConst.moreSvg,
                    height: svgHeight,
                    color: selectedIndex == 3
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyStyle.text0(
                    fontSize: 10,
                    text: "More",
                    color: selectedIndex == 3
                        ? MyStyle.colorWhite
                        : MyStyle.colorGrey,
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
