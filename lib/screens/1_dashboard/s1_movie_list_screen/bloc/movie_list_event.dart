part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {}

@immutable
class LoadMoviesListEvent extends MovieListEvent {}
