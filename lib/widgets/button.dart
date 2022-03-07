import 'package:flutter/material.dart';
import 'package:movie_app/utils/style/style_util.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.width,
    required this.onTap,
    required this.text,
    this.color = MyStyle.buttonColorBlue,
    this.textColor = MyStyle.textColorWhite,
  }) : super(key: key);

  final double width;
  final VoidCallback onTap;
  final String text;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MyStyle.buttonHeight,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(
            MyStyle.borderRadius1,
          )),
        ),
        child: Center(
          child: MyStyle.text1(
            text: text,
            color: MyStyle.textColorWhite,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
