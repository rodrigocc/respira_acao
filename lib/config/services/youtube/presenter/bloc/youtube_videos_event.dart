part of 'youtube_videos_bloc.dart';

sealed class YoutubeVideosEvent extends Equatable {
  const YoutubeVideosEvent();

  @override
  List<Object> get props => [];
}

class FetchYoutubeVideosEvent extends YoutubeVideosEvent {
  final String playlistId;

  const FetchYoutubeVideosEvent({required this.playlistId});

  @override
  List<Object> get props => [playlistId];
}
