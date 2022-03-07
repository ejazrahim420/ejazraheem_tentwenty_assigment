import 'package:movie_app/screens/1_dashboard/s1_movie_list_screen/repo/i_movie_list_repo.dart';
import 'package:movie_app/utils/api_manager/api_utils.dart';
import 'package:movie_app/utils/api_manager/common_api_service.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';
import 'package:movie_app/utils/const/string_const.dart';
import 'package:movie_app/utils/enums.dart';

class MovieListRepo implements IMovieListRepo {
  @override
  Future<ApiResponseClass> getMoviesList() async {
    ApiResponseClass result = await commonServiceCall(
        apiMethod: EnumApiMethod.get_,
        apiUrl: ApiUtils.movieList,
        queryParams: {StringConst.movieApiKey: StringConst.movieApiValue});

    return result;
  }
}
