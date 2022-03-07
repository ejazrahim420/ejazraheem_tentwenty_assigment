import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/model/m_movie_detail_model.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/repo/movie_detail_repo.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';
import 'package:movie_app/utils/background_isolate_methods.dart';

import 'package:movie_app/utils/enums.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailRepo? _moviesDetailRepo;

  MovieDetailRepo get _getRepoInstance {
    if (_moviesDetailRepo == null) {
      _moviesDetailRepo = MovieDetailRepo();
    }
    return _moviesDetailRepo!;
  }

  MovieDetailBloc() : super(MoviesDetailInitial()) {
    on<LoadMoviesDetailEvent>((event, emit) async {
      emit(LoadingState());
      ApiResponseClass response = await _getRepoInstance.getMoviesDetail(event.movieID);

      //--------------------------------------------------------------
      // If the api sevice call is ok, then we will emit the Success state
      // and pass the data which is firse decoded on separate thread
      // so that we will not loose ane frame on uis part
      
      if (response.myReturn == EnumReturn.ok) {
        emit(SuccessLoadedState(
            moviesDetailModel: await decodeInBackground<MovieDetailModel>(
                response.response, moviesDetailFromJson)));
      } else {
        emit(ErrorLoadedState(errorMessage: response.message!));
      }
    });
  }
}
