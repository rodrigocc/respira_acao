import 'package:dartz/dartz.dart';
import 'package:respira_acao/config/error/failure.dart';
import 'package:respira_acao/features/blog/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class FetchPostsWordPressDataSource {
  Future<Either<Failure, List<PostModel>>> fetchWordPressPosts();
}

class FetchWordPressDataSourceImpl implements FetchPostsWordPressDataSource {
  @override
  Future<Either<Failure, List<PostModel>>> fetchWordPressPosts() async {
    final url =
        Uri.parse("https://cienciadameditacao.com.br/site/wp-json/wp/v2/posts");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final postModels = PostModelFromJson(response.body);

      return postModels;
    } else {
      throw Exception("Error");
    }
  }
}
