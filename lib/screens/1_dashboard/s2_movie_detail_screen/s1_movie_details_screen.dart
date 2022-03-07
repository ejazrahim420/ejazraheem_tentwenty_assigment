import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/utils/route_controller/route_controller.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/bloc/movie_detail_bloc.dart';
import 'package:movie_app/utils/const/assets_const.dart';
import 'package:movie_app/utils/style/style_util.dart';
import 'package:movie_app/widgets/button.dart';
import 'package:movie_app/widgets/common_parent_widget.dart';
import 'package:movie_app/widgets/extra_widgets.dart';
import 'package:movie_app/widgets/loading_widget.dart';

final genereColorList = [
  Color(0xff15d2bc),
  Color(0xffe26ca5),
  Color(0xff564ca3),
  Color(0xffcd9d0f),
  Color(0xff15d2bc),
  Color(0xffe26ca5),
  Color(0xff564ca3),
  Color(0xffcd9d0f),
  Color(0xff15d2bc),
  Color(0xffe26ca5),
  Color(0xff564ca3),
  Color(0xffcd9d0f),
];

class MovieDetailScreen extends StatelessWidget {
  final num movieId;
  final String networkImage;
  const MovieDetailScreen({required this.movieId, required this.networkImage});

  @override
  Widget build(BuildContext context) {
    //-------------------------------------------------------
    // initially we will trigger the event to load the details
    BlocProvider.of<MovieDetailBloc>(context)
        .add(LoadMoviesDetailEvent(movieID: movieId.toInt()));
    //--------------------------------------------------------

    double width = MyStyle.getWidth(context: context, hasPadding: false);
    double height = MyStyle.getHeight(
            context: context, hasNavBar: false, hasAppBar: false) +
        MediaQuery.of(context).padding.top;

    return commonParentWidget(
      width: width,
      hasStatusBarPadding: false,
      widgetChild: SizedBox(
        width: width,
        height: height,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            return Stack(
              children: [
                if (state is SuccessLoadedState)
                  //--------------------------------------------------
                  // Using orientation builder to handle portrait and
                  // landscape mode for the screen
                  //--------------------------------------------------
                  OrientationBuilder(
                    builder: (context, orientation) {
                      return Flex(
                        direction: orientation == Orientation.landscape
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: [
                          Expanded(
                            flex: 60,
                            child: SizedBox(
                              width: width,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CachedNetworkImage(
                                      imageUrl: networkImage,
                                      placeholder: imageLoaderWidget,
                                      errorWidget: imageErrorWidget,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MyStyle.paddingHorizontal),
                                    child: Column(children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).padding.top,
                                      ),
                                      SizedBox(
                                        height: MyStyle.appBarHeight,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () =>
                                                  Navigator.pop(context),
                                              child: SvgPicture.asset(
                                                MyAssetsConst.backSvg,
                                                height: MyStyle.svgHeight,
                                                color: MyStyle.colorWhite,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            MyStyle.text1(
                                                text: "Watch",
                                                color: MyStyle.colorWhite,
                                                weight: FontWeight.w500)
                                          ],
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      MyStyle.text1(
                                        weight: FontWeight.bold,
                                        text: "In Theatres " +
                                            state
                                                .moviesDetailModel.releaseDate!,
                                        color: MyStyle.textColorWhite,
                                      ),
                                      const SizedBox(height: 10),
                                      orientation == Orientation.landscape
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 10),
                                                MyButton(
                                                  width: width * 0.2,
                                                  text: "Get Tickets",
                                                  onTap: () {
                                                    RouteController.push(
                                                      context: context,
                                                      screen: RouteController
                                                          .ticketScreen,
                                                    );
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                                _WatchTrailerButton(
                                                  width: width * 0.2,
                                                  onTap: () {
                                                    RouteController.push(
                                                        context: context,
                                                        screen: RouteController
                                                            .trailerWatchScreen,
                                                        arguments: movieId);
                                                  },
                                                ),
                                                const SizedBox(width: 40),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                MyButton(
                                                  text: "Get Tickets",
                                                  width: width * 0.7,
                                                  onTap: () {
                                                    RouteController.push(
                                                      context: context,
                                                      screen: RouteController
                                                          .ticketScreen,
                                                    );
                                                  },
                                                ),
                                                const SizedBox(height: 10),
                                                _WatchTrailerButton(
                                                  width: width * 0.7,
                                                  onTap: () {
                                                    RouteController.push(
                                                        context: context,
                                                        screen: RouteController
                                                            .trailerWatchScreen,
                                                        arguments: movieId);
                                                  },
                                                ),
                                              ],
                                            ),
                                      SizedBox(
                                          height: orientation ==
                                                  Orientation.landscape
                                              ? 20
                                              : 40),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 40,
                            child: Container(
                              color: MyStyle.colorWhite,
                              width: width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: MyStyle.paddingHorizontalDouble),
                              child: ListView(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyStyle.text1(
                                    text: "Genres",
                                    weight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 10),
                                  Wrap(direction: Axis.horizontal, children: [
                                    for (var i = 0;
                                        i <
                                            state.moviesDetailModel.genres!
                                                .length;
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: genereColorList[i],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MyStyle.borderRadius1))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 6),
                                          child: MyStyle.text0(
                                              text: state.moviesDetailModel
                                                  .genres![i].name!,
                                              weight: FontWeight.w500,
                                              color: MyStyle.textColorWhite),
                                        ),
                                      ),
                                  ]),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: MyStyle.secondaryColor,
                                    height: 1,
                                    width: width,
                                  ),
                                  const SizedBox(height: 10),
                                  MyStyle.text1(
                                    text: "Overview",
                                    weight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 10),
                                  MyStyle.text0(
                                    text: state.moviesDetailModel.overview!,
                                    color: MyStyle.textColorGrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                if (state is ErrorLoadedState)
                  RetryWidget(
                    errorText: state.errorMessage,
                    onRetryTap: () {
                      context
                          .read<MovieDetailBloc>()
                          .add(LoadMoviesDetailEvent(movieID: movieId.toInt()));
                    },
                  ),
                if (state is LoadingState)
                  MyLoadingWidget(width: width, height: height)
              ],
            );
          },
        ),
      ),
    );
  }
}

class _WatchTrailerButton extends StatelessWidget {
  const _WatchTrailerButton({
    Key? key,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MyStyle.buttonHeight,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(
              MyStyle.borderRadius1,
            )),
            border: Border.all(
              color: MyStyle.buttonColorBlue,
              width: 2,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MyAssetsConst.playSvg,
              color: MyStyle.colorWhite,
            ),
            const SizedBox(
              width: 10,
            ),
            MyStyle.text1(
              text: "Watch Trailer",
              color: MyStyle.textColorWhite,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
