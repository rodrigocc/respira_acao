import 'package:dartz/dartz.dart';
import 'package:respira_acao/config/error/failure.dart';
import 'package:respira_acao/config/services/youtube/data/models/video_list_model.dart';

abstract class FetchVideoListRepository {
  Future<Either<Failure, List<Video>>> fetchVideoList(String playlistId);
}
