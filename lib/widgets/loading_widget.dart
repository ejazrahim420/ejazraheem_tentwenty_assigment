import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/utils/style/style_util.dart';

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({
    required this.width,
    required this.height,
  });
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      child: Center(
        child: SpinKitCircle(
          color: MyStyle.colorBlack,
        ),
      ),
    );
  }
}

class RetryWidget extends StatelessWidget {
  const RetryWidget(
      {Key? key, required this.onRetryTap, required this.errorText})
      : super(key: key);
  final VoidCallback onRetryTap;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(errorText),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: onRetryTap,
              child: Text('Retry'),
              style: ElevatedButton.styleFrom(
                primary: MyStyle.primaryColor,
              ))
        ],
      ),
    );
  }
}
