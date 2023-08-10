import 'package:dio/dio.dart';
import 'package:respira_acao/features/blog/data/models/post_model.dart';

class WordPressHttpClient {
  Future<List<PostModel>> getPosts() async {
    final dio = Dio();

    final response = await dio
        .get("https://cienciadameditacao.com.br/site/wp-json/wp/v2/posts");

    final result = PostModelFromJson(response.data);

    return result;
  }
}
