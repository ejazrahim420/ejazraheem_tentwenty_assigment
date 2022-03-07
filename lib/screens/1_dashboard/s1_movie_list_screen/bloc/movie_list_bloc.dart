import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/screens/1_dashboard/s1_movie_list_screen/repo/movie_list_repo.dart';
import 'package:movie_app/screens/1_dashboard/s1_movie_list_screen/model/m_movie_list_model.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';

import 'package:movie_app/utils/background_isolate_methods.dart';

import 'package:movie_app/utils/enums.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListRepo? _dashBoardRepo;

  MovieListRepo get getRepoInstance {
    if (_dashBoardRepo == null) {
      _dashBoardRepo = MovieListRepo();
    }
    return _dashBoardRepo!;
  }

  MovieListBloc() : super(IntialState()) {
    on<LoadMoviesListEvent>((event, emit) async {
      emit(LoadingState());
      ApiResponseClass response = await getRepoInstance.getMoviesList();

      //--------------------------------------------------------------
      // If the api sevice call is ok, then we will emit the Success state
      // and pass the data which is firse decoded on separate thread
      // so that we will not loose ane frame on uis part

      if (response.myReturn == EnumReturn.ok) {
        emit(SuccessLoadedState(
            moviesListModel: await decodeInBackground<MovieListModel>(
                response.response, moviesModelFromJson)));
      }

      //--------------------------------------------------------------
      // If api service call is not ok, we will emit the error
      // state and pass the message for the ui

      else {
        emit(ErrorLoadedState(errorMessage: response.message!));
      }
    });
  }
}
