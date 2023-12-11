import 'package:dartz/dartz.dart';
import 'package:respira_acao/config/error/failure.dart';
import 'package:respira_acao/config/services/wordpress/domain/repositories/fetch_posts_repository.dart';
import 'package:respira_acao/config/services/youtube/domain/asynclist_usecase.dart';
import 'package:respira_acao/features/blog/data/models/post_model.dart';

class FetchPostsWordPressUsecase implements AsyncListUseCase {
  final FetchPostsWordPressRepository fetchPostsWordPressRepositoryl;

  FetchPostsWordPressUsecase({required this.fetchPostsWordPressRepositoryl});

  @override
  Future<Either<Failure, List<PostModel>>> call(params) async =>
      await fetchPostsWordPressRepositoryl.fetchWordPressPosts();
}
