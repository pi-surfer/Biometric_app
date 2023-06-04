import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

String link2 = 'assets/videos/patagonia.mp4';

class VideoWidget1 extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget1> {
 late VideoPlayerController _controller;
 
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(link2)
    ..initialize().then((_) {
      _controller.setVolume(0.0);
      _controller.setLooping(true);
      _controller.play();
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context){
  return Center(
    child: _controller.value.isInitialized
    ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
  : Container() 
  );  
}

@override
void  dispose() {
  super.dispose();
  _controller.dispose();
}

}

