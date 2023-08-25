import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:respira_acao/config/services/youtube/models/channel_info_model.dart';
import 'package:respira_acao/config/services/youtube/models/youtube_service.dart';

class VideoListPage extends StatefulWidget {
  final String playlistId;
  const VideoListPage({super.key, required this.playlistId});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late ChannelInfo _channelInfo;

  late Item _item;

  late bool _loading;

  _getChannelInfo() async {
    _channelInfo = await YouTubeService.getChannelInfo();
    _item = _channelInfo.items[0];

    setState(() {
      _loading = false;
    });
  }

  _buildInfoChannelViewWidget() {
    return Container(
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  _item.snippet.thumbnails.medium.url),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              _item.snippet.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(_item.statistics.videoCount),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }

  _loadVideos() async {
    await YouTubeService.getListVideosFromPlaylistId(widget.playlistId);
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    _getChannelInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                child: Column(
                  children: [_buildInfoChannelViewWidget()],
                ),
              ));
  }
}
