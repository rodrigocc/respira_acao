import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:respira_acao/config/services/youtube/data/models/channel_info_model.dart';
import 'package:respira_acao/config/services/youtube/data/models/video_list_model.dart';
import 'package:respira_acao/config/services/youtube_datasource.dart';

import '../data/models/playlist_by_id_model.dart';

class VideoListPage extends StatefulWidget {
  final String playlistId;

  const VideoListPage({super.key, required this.playlistId});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  late ChannelInfo _channelInfo;

  late Item _item;

  late VideoList _videolist;

  late bool _loading;

  late String _playlistId;

  _getChannelInfo() async {
    _channelInfo = await YoutubeDatasource.getChannelInfo();
    _item = _channelInfo.items[0];
    _videolist = VideoList();
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    _getChannelInfo();
    // _loadVideos();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildInfoChannelViewWidget()],
                ),
              ));
  }

  _buildInfoChannelViewWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(width: 20),
            Text(_item.statistics.videoCount),
          ],
        ),
      ),
    );
  }
}
