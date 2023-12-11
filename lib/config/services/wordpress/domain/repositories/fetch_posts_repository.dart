import 'package:dartz/dartz.dart';
import 'package:respira_acao/config/error/failure.dart';

import '../../../../../features/blog/data/models/post_model.dart';

abstract class FetchPostsWordPressRepository {
  Future<Either<Failure, List<PostModel>>> fetchWordPressPosts();
}
