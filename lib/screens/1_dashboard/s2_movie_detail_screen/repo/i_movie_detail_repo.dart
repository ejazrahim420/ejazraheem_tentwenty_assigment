import 'package:movie_app/utils/api_manager/api_response_class.dart';

abstract class IMovieDetailRepo {
  Future<ApiResponseClass> getMoviesDetail(int movieID);
}
