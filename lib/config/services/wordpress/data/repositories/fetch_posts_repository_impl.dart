import 'package:dartz/dartz.dart';
import 'package:respira_acao/config/error/failure.dart';
import 'package:respira_acao/config/services/wordpress/data/datasources/fetch_posts_wordpress_datasource.dart';
import 'package:respira_acao/config/services/wordpress/domain/repositories/fetch_posts_repository.dart';
import 'package:respira_acao/features/blog/data/models/post_model.dart';

class FetchPostsWordPressRepositoryImpl
    implements FetchPostsWordPressRepository {
  final FetchPostsWordPressDataSource fetchPostsWordPressDataSource;

  FetchPostsWordPressRepositoryImpl(
      {required this.fetchPostsWordPressDataSource});
  @override
  Future<Either<Failure, List<PostModel>>> fetchWordPressPosts() async =>
      await fetchPostsWordPressDataSource.fetchWordPressPosts();
}
