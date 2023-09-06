part of 'youtube_videos_bloc.dart';

sealed class YoutubeVideosState extends Equatable {
  const YoutubeVideosState();

  @override
  List<Object> get props => [];
}

final class YoutubeVideosInitial extends YoutubeVideosState {}

final class YoutubeVideosLoading extends YoutubeVideosState {}

final class YoutubeVideosLoaded extends YoutubeVideosState {
  final List<Video> videoList;

  const YoutubeVideosLoaded({required this.videoList});

  @override
  List<Object> get props => [videoList];
}

final class YoutubeVideosError extends YoutubeVideosState {
  final String? errorMsg;

  const YoutubeVideosError({this.errorMsg});

  @override
  List<Object> get props => [errorMsg!];
}
