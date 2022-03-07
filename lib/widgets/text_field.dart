import 'package:flutter/material.dart';
import 'package:movie_app/utils/style/style_util.dart';

class MyCustomTextField extends StatelessWidget {
  final TextEditingController tec;
  final String hintText;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double height;
  final bool autoFocus;
  final int maxLines;
  final bool isEnabled;

  const MyCustomTextField(
      {Key? key,
      required this.tec,
      required this.hintText,
      this.textStyle,
      this.height = MyStyle.textFieldHeight,
      this.maxLines = 1,
      this.autoFocus = false,
      this.isEnabled = true,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: TextField(
          autofocus: autoFocus,
          controller: tec,
          enabled: isEnabled,
          cursorColor: MyStyle.cursorColor,
          style: textStyle ??
              MyStyle.textStyle1(
                context: context,
              ),
          maxLines: maxLines,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: textStyle ??
                  MyStyle.textStyle1(
                    context: context,
                  ),
              contentPadding: contentPadding),
        ),
      ),
    );
  }
}
