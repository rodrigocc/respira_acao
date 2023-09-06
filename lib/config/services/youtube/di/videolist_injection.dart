import 'package:respira_acao/config/services/youtube/data/datasources/fetch_videolist_datasource.dart';
import 'package:respira_acao/config/services/youtube/data/repositories/fetch_video_list_repository.dart';
import 'package:respira_acao/config/services/youtube/domain/repositories/fetch_video_list_repository.dart';
import 'package:respira_acao/config/services/youtube/domain/usecases/fetch_video_list_usecase.dart';
import 'package:respira_acao/config/services/youtube/presenter/bloc/youtube_videos_bloc.dart';
import 'package:respira_acao/injection_container.dart';

Future<void> videoListInjection() async {
  serviceLocator.registerFactory(() => YoutubeVideosBloc(serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => FetchVideoListUseCase(serviceLocator()));

  serviceLocator.registerLazySingleton<FetchVideoListRepository>(
      () => FetchVideoListRepositoryImpl(serviceLocator()));

  serviceLocator.registerLazySingleton<FetchYoutubeVideoListDataSource>(
      () => FetchYoutubeVideoListDataSourceImpl());
}
