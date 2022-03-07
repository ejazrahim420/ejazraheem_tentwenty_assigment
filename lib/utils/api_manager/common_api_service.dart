
import 'package:dio/dio.dart';
import 'package:movie_app/utils/enums.dart';
import 'package:movie_app/utils/api_manager/connectivity_util.dart';
import 'package:movie_app/utils/api_manager/exception.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';

Future<ApiResponseClass> commonServiceCall({
  var body,
  required String apiUrl,
  required EnumApiMethod apiMethod,
  var queryParams,
}) async {

  ApiResponseClass res = await initConnectivity();
  if (res.myReturn == EnumReturn.error) {
    return ApiResponseClass(message: res.message, myReturn: EnumReturn.error);
  }
  try {
    Response response;
    Dio dio = Dio();

    if (apiMethod == EnumApiMethod.post) {
      response = await dio.post(
        apiUrl,
        data: body,
        queryParameters: queryParams,
      );
    } else if (apiMethod == EnumApiMethod.delete) {
      response =
          await dio.delete(apiUrl, data: body, queryParameters: queryParams);
    } else if (apiMethod == EnumApiMethod.put) {
      response =
          await dio.put(apiUrl, data: body, queryParameters: queryParams);
    } else {
      response = await dio.get(apiUrl, queryParameters: queryParams);
    }

    if (response.statusCode == 200) {
      return ApiResponseClass(response: response.data, myReturn: EnumReturn.ok);
    } else {
      return ApiResponseClass(
          message: "Processing Error. Please Contact Admin",
          myReturn: EnumReturn.error);
    }
  } catch (e) {

    if (e is DioError) {
      final errorMessage = DioExceptions.fromDioError(e).toString();

      return ApiResponseClass(message: errorMessage, myReturn: EnumReturn.error);
    } else {
      return ApiResponseClass(
          message: "Processing Error. Please Contact Admin",
          myReturn: EnumReturn.error);
    }
  }
}
