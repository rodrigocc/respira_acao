import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:respira_acao/config/services/youtube/components/video_player_page.dart';
import 'package:respira_acao/config/services/youtube/data/models/video_list_model.dart';
import 'package:respira_acao/config/services/youtube/presenter/bloc/youtube_videos_bloc.dart';

class VideoListDisplay extends StatefulWidget {
  const VideoListDisplay({super.key});

  @override
  State<VideoListDisplay> createState() => _VideoListDisplayState();
}

class _VideoListDisplayState extends State<VideoListDisplay> {
  List<Video> videoList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<YoutubeVideosBloc>(context).add(FetchYoutubeVideosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YoutubeVideosBloc, YoutubeVideosState>(
      builder: (context, state) {
        if (state is YoutubeVideosLoaded) {
          videoList = state.videoList;

          return ListView.builder(
            itemCount: videoList.length,
            itemBuilder: (_, index) {
              Video videoItem = videoList[index];
              return InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerPage(videoItem: videoItem)));
                },
                child: ListTile(
                    leading: Image.network(
                        videoList[index].snippet.thumbnails.medium.url),
                    title: Text(
                      videoList[index].snippet.title,
                    )),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
