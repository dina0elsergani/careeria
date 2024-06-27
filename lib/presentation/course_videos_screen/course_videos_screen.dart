import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:careeria/widgets/app_bar/appbar_leading_image.dart';
import 'package:careeria/widgets/app_bar/appbar_subtitle.dart';
import 'package:careeria/widgets/app_bar/custom_app_bar.dart';
import 'package:careeria/core/app_export.dart';

class CourseVideosScreen extends StatefulWidget {
  final String videoUrl;

  const CourseVideosScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  CourseVideosScreenState createState() => CourseVideosScreenState();
}

class CourseVideosScreenState extends State<CourseVideosScreen> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    // Extract the video ID from the URL
    String videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children:[
          SizedBox(height: 170,),
           YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,
          onReady: () {
            _youtubePlayerController.play();
          },
        ),
      ]),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 31.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftPrimary,
        margin: EdgeInsets.only(left: 21.h, top: 19.v, bottom: 16.v),
        onTap: () => onTapArrowLeft(context),
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: 'Course Video'),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  void onTapArrowLeft(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.studentCoursesScreenPage);
  }
}
