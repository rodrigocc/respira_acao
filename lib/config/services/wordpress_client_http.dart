import 'package:respira_acao/features/blog/data/models/post_model.dart';

import 'package:http/http.dart' as http;

class WordPressHttpClient {
  Future<List<PostModel>> getPosts() async {
    final url =
        Uri.parse("https://cienciadameditacao.com.br/site/wp-json/wp/v2/posts");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final postModels = PostModelFromJson(response.body);

      print(postModels);

      return postModels;
    } else {
      throw Exception("Error");
    }
  }
}
