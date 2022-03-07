import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/screens/1_dashboard/s2_movie_detail_screen/model/m_get_videos_model.dart';
import 'package:movie_app/utils/api_manager/api_utils.dart';
import 'package:movie_app/utils/api_manager/common_api_service.dart';
import 'package:movie_app/utils/api_manager/api_response_class.dart';
import 'package:movie_app/utils/const/string_const.dart';
import 'package:movie_app/utils/enums.dart';
import 'package:movie_app/utils/style/style_util.dart';
import 'package:movie_app/widgets/loading_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerWatchScreen extends StatefulWidget {
  const TrailerWatchScreen({Key? key, required this.movieId}) : super(key: key);
  final num movieId;
  @override
  _TrailerWatchScreenState createState() => _TrailerWatchScreenState();
}

class _TrailerWatchScreenState extends State<TrailerWatchScreen> {
  late YoutubePlayerController _playerController;
  bool _isLoading = true;

  final List<String> _videoIds = [];

  _initialMethod() async {
    //-----------------------------------------------
    // First we will hit the apis to get the videos
    ApiResponseClass result = await commonServiceCall(
        apiMethod: EnumApiMethod.get_,
        apiUrl: ApiUtils.movieDetails + widget.movieId.toString() + "/videos",
        queryParams: {StringConst.movieApiKey: StringConst.movieApiValue});

    //-----------------------------------------------
    // If our result is ok then we will find the video
    // which is of type "trailer", if we find it then
    // we will break the loop and stop the search, and
    // initialize the playerController otherwise not

    if (result.myReturn == EnumReturn.ok) {
      GetVideosModel obj = GetVideosModel.fromJson(result.response);
      if (obj.results != null) {
        for (var i = 0; i < obj.results!.length; i++) {
          if (obj.results![i].type!.toLowerCase() == "trailer") {
            _videoIds.add(obj.results![i].key!);
            break;
          }
        }

        if (_videoIds.length > 0) {
          _playerController = YoutubePlayerController(
            initialVideoId: _videoIds.first,
            flags: const YoutubePlayerFlags(
              mute: false,
              autoPlay: true,
              disableDragSeek: false,
              loop: false,
              isLive: false,
              forceHD: false,
              enableCaption: true,
            ),
          )..addListener(listener);
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initialMethod();
  }

  void listener() {}

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height =
        MyStyle.getHeight(context: context, hasNavBar: false, hasAppBar: false);
    double width = MyStyle.getWidth(
      context: context,
    );
    return Scaffold(
      body: _isLoading
          ? MyLoadingWidget(height: height, width: width)
          : _videoIds.length == 0
              ? Center(
                  child: MyStyle.text1(text: "No Video Found"),
                )
              : YoutubePlayerBuilder(
                  onExitFullScreen: () {
                    // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                    SystemChrome.setPreferredOrientations(
                        DeviceOrientation.values);
                  },
                  player: YoutubePlayer(
                    controller: _playerController,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: MyStyle.primaryColor,
                    topActions: <Widget>[
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          _playerController.metadata.title,
                          style: const TextStyle(
                                 color: MyStyle.colorWhite,
                            fontSize: 18.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: MyStyle.colorWhite,
                          size: 25.0,
                        ),
                        onPressed: () {},
                      ),
                    ],
                    onReady: () {},
                    onEnded: (data) {
                      Navigator.pop(context);
                    },
                  ),
                  builder: (context, player) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [player],
                  ),
                ),
    );
  }
}
