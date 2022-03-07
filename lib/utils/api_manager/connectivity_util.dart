import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';
import 'package:movie_app/utils/const/message_const.dart';
import 'package:movie_app/utils/enums.dart';

Future<ApiResponseClass> initConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return ApiResponseClass(
      myReturn: EnumReturn.ok,
    );
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return ApiResponseClass(
      myReturn: EnumReturn.ok,
    );
  } else {
    return ApiResponseClass(
      myReturn: EnumReturn.error,
      message: MyMessageConst.internetMessage,
    );
  }

  //--------- old plugin code

  // ConnectivityResult result = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();

  // result = await _connectivity.checkConnectivity();

  // switch (result) {
  //   case ConnectivityResult.none:
  // return GeneralClassApi(
  //   myReturn: EnumReturn.error,
  //   message: MyMessageConst.internetMessage,
  // );

  //   default:
  // return GeneralClassApi(
  //   myReturn: EnumReturn.ok,
  // );
  // }
}
