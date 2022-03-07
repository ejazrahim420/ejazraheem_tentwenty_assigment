import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/utils/const/assets_const.dart';
import 'package:movie_app/utils/style/style_util.dart';
import 'package:movie_app/widgets/button.dart';
import 'package:movie_app/widgets/common_parent_widget.dart';

class TicketScreen extends StatelessWidget {
  final List<Color> _seatColorList = [
    MyStyle.colorGrey,
    MyStyle.buttonColorBlue,
    MyStyle.colorGrey,
    MyStyle.colorGrey,
    MyStyle.colorGrey,
    MyStyle.colorGrey,
    Color(0xff564ca3),
    MyStyle.colorGrey,
    MyStyle.buttonColorBlue,
    MyStyle.buttonColorBlue,
    MyStyle.buttonColorBlue,
    MyStyle.buttonColorBlue,
    MyStyle.colorGrey
  ];

  @override
  Widget build(BuildContext context) {
    double width = MyStyle.getWidth(context: context, hasPadding: false);
    double height =
        MyStyle.getHeight(context: context, hasNavBar: false, hasAppBar: false);

    return commonParentWidget(
      width: width,
      widgetChild: SizedBox(
        height: height,
        child: Column(children: [
          _AppBar(),
          Expanded(
              flex: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.8,
                    height: 50,
                    child: CustomPaint(
                      painter: _MyCustomPaint(),
                    ),
                  ),
                  MyStyle.text0(text: "Screen", color: MyStyle.textColorGrey),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 2,
                    ),
                    itemBuilder: (context, upperIndex) {
                      return Container(
                        width: width,
                        height: 20,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 15,
                              child: MyStyle.text0(
                                  text: (upperIndex + 1).toString()),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 27,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 5,
                                      ),
                                  itemBuilder: (context, index) {
                                    return SvgPicture.asset(
                                      MyAssetsConst.seatSvg,
                                      color: _getSeatColor(
                                          upperIndex: upperIndex, index: index),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )),
          Expanded(
              flex: 40,
              child: Container(
                color: MyStyle.colorWhite,
                padding:
                    EdgeInsets.symmetric(horizontal: MyStyle.paddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _SeatWidget(
                            text: "Selected",
                            color: Color(0xffcd9d0f),
                          ),
                        ),
                        Expanded(
                          child: _SeatWidget(
                            text: "Not Available",
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _SeatWidget(
                            text: "VIP (150\$)",
                            color: Color(0xff564ca3),
                          ),
                        ),
                        Expanded(
                          child: _SeatWidget(
                            text: "Regular (50\$)",
                            color: MyStyle.buttonColorBlue,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: MyStyle.contentPaddingHorizontal),
                      decoration: BoxDecoration(
                          color: MyStyle.secondaryColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(MyStyle.borderRadius1))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyStyle.text1(text: "4/3 row"),
                          SizedBox(
                            width: 04,
                          ),
                          Icon(Icons.close)
                        ],
                      ),
                    ),
                    Expanded(
                      child: const SizedBox(),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: MyStyle.contentPaddingHorizontal),
                          decoration: BoxDecoration(
                              color: MyStyle.secondaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MyStyle.borderRadius1))),
                          child: Column(
                            children: [
                              MyStyle.text0(text: "Total Price"),
                              MyStyle.text1(
                                text: "50\$",
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: MyButton(
                                width: 0,
                                onTap: () {},
                                text: "Proceed to Pay")),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }

  Color _getSeatColor({required int upperIndex, required int index}) {
    if (index == 0 || index == 6 || index == 21) {
      return MyStyle.secondaryColor;
    }

    if (upperIndex == 0) {
      if (index == 0 ||
          index == 1 ||
          index == 2 ||
          index == 3 ||
          index == 24 ||
          index == 25 ||
          index == 26) {
        return MyStyle.secondaryColor;
      }
    }
    if (upperIndex == 1 || upperIndex == 2 || upperIndex == 3) {
      if (index == 0 || index == 1 || index == 25 || index == 26) {
        return MyStyle.secondaryColor;
      }
    }
    return _seatColorList[Random().nextInt(_seatColorList.length)];
  }
}

class _SeatWidget extends StatelessWidget {
  _SeatWidget({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          MyAssetsConst.seatSvg,
          color: color,
          height: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        MyStyle.text1(text: text, color: MyStyle.textColorGrey)
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: MyStyle.colorWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                width: 50,
                child: SvgPicture.asset(
                  MyAssetsConst.backSvg,
                  height: MyStyle.svgHeight,
                  color: MyStyle.colorBlack,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStyle.text1(
                  text: "The Batman",
                  weight: FontWeight.bold,
                ),
                MyStyle.text0(
                  color: MyStyle.buttonColorBlue,
                  text: " March 29, 2022  I  12:30 hall 1",
                  weight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              width: 50,
            ),
          ],
        ));
  }
}

class _MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = MyStyle.buttonColorBlue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;

    var path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
