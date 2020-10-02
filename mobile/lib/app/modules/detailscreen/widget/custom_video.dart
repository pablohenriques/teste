import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

class CustomVideo extends StatefulWidget {
  CustomVideo(this.data, {Key key}) : super(key: key);

  final File data;
  @override
  _CustomVideoState createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.file(widget.data),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 450,
      child: VisibilityDetector(
        key: ObjectKey(flickManager),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0 && this.mounted) {
            flickManager.flickControlManager.pause();
          } else if (visibility.visibleFraction == 1) {
            flickManager.flickControlManager.play();
          }
        },
        child: Container(
          child: FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: FlickVideoWithControls(
              controls: FlickPortraitControls(),
            ),
            flickVideoWithControlsFullscreen: FlickVideoWithControls(
              controls: FlickLandscapeControls(),
            ),
          ),
        ),
      ),
    );
  }
}
