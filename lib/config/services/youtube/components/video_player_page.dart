import 'package:flutter/material.dart';
import '../data/models/video_list_model.dart';
import '../../../../features/how_i_feel_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final Video videoItem;

  const VideoPlayerPage({super.key, required this.videoItem});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  late bool _isPlayerReady;

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
  }

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoItem.snippet.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoItem.snippet.title),
      ),
      body: Container(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            print("player is ready");
            _isPlayerReady = true;
          },
        ),
      ),
    );
  }

  // Function(YoutubeMetaData)? onEndedVideo() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (_) => const HowIfeelPage()));
  //   return null;
  // }
}
