part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

@immutable
class LoadMoviesDetailEvent extends MovieDetailEvent {
  LoadMoviesDetailEvent({required this.movieID});
  final int movieID;
}
