import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/1_dashboard/s1_movie_list_screen/bloc/movie_list_bloc.dart';
import 'package:movie_app/screens/1_dashboard/s1_movie_list_screen/s_movie_list_screen.dart';
import 'package:movie_app/screens/2_watch/watch_screen.dart';

import 'package:movie_app/screens/3_media/media_screen.dart';
import 'package:movie_app/screens/4_more/more_screen.dart';
import 'package:movie_app/widgets/bottom_nav_bar.dart';

import '../utils/style/style_util.dart';
import '../widgets/common_parent_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
   {
  late PageController pageController;
  int bottomNavSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    double width = MyStyle.getWidth(context: context, hasPadding: false);
    double height =
        MyStyle.getHeight(context: context, hasNavBar: true, hasAppBar: false);

    return commonParentWidget(
      width: width,
      hasBodyPadding: false,
      bottomNavBar: StatefulBuilder(
        builder: (context, _mySetState) => BottomNavBarOfMainApp(
          height: MyStyle.bottomNavbarHeight,
          width: width,
          selectedIndex: bottomNavSelectedIndex,
          onItemClick: (index) {
            bottomNavSelectedIndex = index;
            pageController.jumpToPage(bottomNavSelectedIndex);
            _mySetState(() {});
          },
        ),
      ),

//---------------- Main Ui -----------------

      widgetChild: SizedBox(
        width: width,
        height: height,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {},
          children: [
            BlocProvider(
              create: (context) => MovieListBloc(),
              child: MovieListScreen(
                width: width,
                height: height,
              ),
            ),
            WatchScreen(
              width: width,
              height: height,
            ),
            MediaScreen(
              width: width,
              height: height,
            ),
            MoreScreen(
              width: width,
              height: height,
            ),
          ],
        ),
      ),
    );
  }
}
