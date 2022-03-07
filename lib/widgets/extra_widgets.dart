import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/utils/style/style_util.dart';

Widget imageLoaderWidget(BuildContext context, String url) {
  return Center(
    child: SpinKitPulse(
      size: 50,
      color: MyStyle.primaryColor,
    ),
  );
}

Widget imageErrorWidget(BuildContext context, String url, dynamic error) {
  return const Center(child: Icon(Icons.error));
}
