import 'package:flutter/material.dart';
import 'package:respira_acao/config/services/youtube/models/youtube_service.dart';

class VideoListPage extends StatefulWidget {
  final String playlistId;
  const VideoListPage({super.key, required this.playlistId});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  _buildInfoChannelViewWidget() async {
    await YouTubeService.getChannelInfo();
  }

  _loadVideos() async {
    await YouTubeService.getListVideosFromPlaylistId(widget.playlistId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (_, index) {
        return const ListTile();
      }),
    );
  }
}
