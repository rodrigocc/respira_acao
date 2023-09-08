import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:respira_acao/config/services/youtube/domain/asynclist_usecase.dart';
import 'package:respira_acao/config/services/youtube/domain/usecases/fetch_video_list_usecase.dart';

import '../../data/models/video_list_model.dart';

part 'youtube_videos_event.dart';
part 'youtube_videos_state.dart';

class YoutubeVideosBloc extends Bloc<YoutubeVideosEvent, YoutubeVideosState> {
  final FetchVideoListUseCase fetchVideoListUseCase;

  YoutubeVideosBloc(this.fetchVideoListUseCase)
      : super(YoutubeVideosInitial()) {
    on<FetchYoutubeVideosEvent>((event, emit) async {
      final result = await fetchVideoListUseCase.call(event.playlistId);

      if (result.isRight()) {
        emit(YoutubeVideosLoaded(videoList: result.getOrElse(() => [])));
      } else {
        emit(const YoutubeVideosError());
      }
    });
  }
}
