import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/utils/route_controller/route_controller.dart';
import 'package:movie_app/screens/1_dashboard/s1_movie_list_screen/bloc/movie_list_bloc.dart';
import 'package:movie_app/utils/api_manager/api_utils.dart';
import 'package:movie_app/utils/style/style_util.dart';
import 'package:movie_app/widgets/extra_widgets.dart';
import 'package:movie_app/widgets/loading_widget.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double width, height;

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

//--------------------------------------------------------------
// We are using a mixin AutomaticKeepAlive to maintain the previous state
// when switching between the bottom nav bar items

class _MovieListScreenState extends State<MovieListScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    //-------------------------------------------------------
    // initially we will trigger the event to load the movies

    BlocProvider.of<MovieListBloc>(context, listen: false)
        .add(LoadMoviesListEvent());
  }

  final double cardHeight = 200;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: widget.width,
      height: widget.height,
      child: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state is SuccessLoadedState)
                Column(
                  children: [
                    TopWidget(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MyStyle.paddingHorizontal),
                        child: ListView.separated(
                          itemCount: state.moviesListModel.results!.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                RouteController.push(
                                    context: context,
                                    screen: RouteController.movieDetailScreen,
                                    arguments: [
                                      state.moviesListModel.results![index].id!,
                                      ApiUtils.prefixImageLoadPath +
                                          state.moviesListModel.results![index]
                                              .posterPath!,
                                    ]);
                              },
                              child: Container(
                                height: cardHeight,
                                decoration: BoxDecoration(
                                    color: MyStyle.colorWhite,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MyStyle.borderRadius2))),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: widget.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MyStyle.borderRadius2)),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              ApiUtils.prefixImageLoadPath +
                                                  state
                                                      .moviesListModel
                                                      .results![index]
                                                      .posterPath!,
                                          placeholder: imageLoaderWidget,
                                          errorWidget: imageErrorWidget,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: MyStyle.contentPaddingVertical,
                                      left: MyStyle.contentPaddingHorizontal,
                                      child: MyStyle.text1(
                                          text: state.moviesListModel
                                              .results![index].title!,
                                          color: MyStyle.textColorWhite,
                                          weight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              if (state is ErrorLoadedState)
                RetryWidget(
                  errorText: state.errorMessage,
                  onRetryTap: () {
                    context.read<MovieListBloc>().add(LoadMoviesListEvent());
                  },
                ),
              if (state is LoadingState)
                MyLoadingWidget(
                  height: widget.height,
                  width: widget.width,
                )
            ],
          );
        },
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: MyStyle.colorWhite,
        padding: EdgeInsets.symmetric(horizontal: MyStyle.paddingHorizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyStyle.text1(text: "Watch", weight: FontWeight.w500),
            Icon(
              Icons.search,
              color: MyStyle.colorBlack,
            )
          ],
        ));
  }
}
