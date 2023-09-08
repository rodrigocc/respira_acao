import 'package:dartz/dartz.dart';
import '../../../../error/failure.dart';
import '../asynclist_usecase.dart';
import '../../data/models/video_list_model.dart';
import '../repositories/fetch_video_list_repository.dart';

class FetchVideoListUseCase implements AsyncListUseCase<Video, String> {
  final FetchVideoListRepository videoListRepository;

  FetchVideoListUseCase(this.videoListRepository);

  @override
  Future<Either<Failure, List<Video>>> call(String playListId) async {
    return await videoListRepository.fetchVideoList(playListId);
  }
}
