import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/s1_movie_details_screen.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/s2_trailer_watch_screen.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/s3_ticket_screen.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/bloc/movie_detail_bloc.dart'
    as detailBloc;

abstract class RouteController {
  // ---------------- Screen names----------------
  static const String homeScreen = "homeScreen";
  static const String movieDetailScreen = "movieDetailScreen";
  static const String trailerWatchScreen = "trailerWatchScreen";
  static const String ticketScreen = "ticketScreen";
  // ---------------------------------------------

  static const int animationTransitionDuration = 300;

  // ---------------- Navigation methods --------------

  static push(
      {required BuildContext context, required String screen, var arguments}) {
    Navigator.pushNamed(context, screen, arguments: arguments);
  }

  static pushAndRemove(
      {required BuildContext context, required String screen, var arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, screen, (route) => false,
        arguments: arguments);
  }

  // ---------------- Route controller -----------------------
  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: animationTransitionDuration),
          child: const HomeScreen(),
        );

      case movieDetailScreen:
        var argumentList = settings.arguments as List;
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: animationTransitionDuration),
          child: BlocProvider(
            create: (context) => detailBloc.MovieDetailBloc(),
            child: MovieDetailScreen(
              movieId: argumentList[0],
              networkImage: argumentList[1],
            ),
          ),
        );

      case trailerWatchScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: animationTransitionDuration),
          child: TrailerWatchScreen(
            movieId: settings.arguments as num,
          ),
        );

      case ticketScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: animationTransitionDuration),
          child: TicketScreen(),
        );
      default:
        throw ("no route found");
    }
  }
}
