import 'package:movie_app/utils/enums.dart';

class ApiResponseClass {
  dynamic response;
  EnumReturn? myReturn;
  String? message;
  ApiResponseClass({this.myReturn, this.response, this.message});
}
