part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MoviesDetailInitial extends MovieDetailState {}

@immutable
class LoadingState extends MovieDetailState {}

@immutable
class SuccessLoadedState extends MovieDetailState {
  SuccessLoadedState({required this.moviesDetailModel});

  final MovieDetailModel moviesDetailModel;
}

@immutable
class ErrorLoadedState extends MovieDetailState {
  ErrorLoadedState({required this.errorMessage});

  final String errorMessage;
}
