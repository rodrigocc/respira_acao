import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:respira_acao/config/error/failure.dart';
import 'package:respira_acao/config/services/youtube/data/datasources/fetch_videolist_datasource.dart';
import 'package:respira_acao/config/services/youtube/domain/repositories/fetch_video_list_repository.dart';
import 'package:respira_acao/config/services/youtube/data/models/video_list_model.dart';
import 'package:respira_acao/config/services/youtube_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:respira_acao/laboratory/secret.dart';

class FetchVideoListRepositoryImpl implements FetchVideoListRepository {
  final FetchYoutubeVideoListDataSource youtubeDatasource;

  FetchVideoListRepositoryImpl(this.youtubeDatasource);

  @override
  Future<Either<Failure, List<Video>>> fetchVideoList() async {
    try {
      final result = await youtubeDatasource.fetchVideoList();

      return Right(result);
    } on Exception {
      return Left(ResponseApiFailure());
    }
  }
}
