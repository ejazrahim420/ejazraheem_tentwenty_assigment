part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState {}

@immutable
class IntialState extends MovieListState {}

@immutable
class LoadingState extends MovieListState {}

@immutable
class SuccessLoadedState extends MovieListState {
  SuccessLoadedState({required this.moviesListModel});

  final MovieListModel moviesListModel;
}

@immutable
class ErrorLoadedState extends MovieListState {
  ErrorLoadedState({required this.errorMessage});
  final String errorMessage;
}
