import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/repo/i_movie_detail_repo.dart';
import 'package:movie_app/utils/api_manager/api_utils.dart';
import 'package:movie_app/utils/api_manager/common_api_service.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';
import 'package:movie_app/utils/const/string_const.dart';
import 'package:movie_app/utils/enums.dart';

class MovieDetailRepo implements IMovieDetailRepo {
  @override
  Future<ApiResponseClass> getMoviesDetail(int movieID) async {
    ApiResponseClass result = await commonServiceCall(
        apiMethod: EnumApiMethod.get_,
        apiUrl: ApiUtils.movieDetails + movieID.toString(),
        queryParams: {StringConst.movieApiKey: StringConst.movieApiValue});

    return result;
  }
}
