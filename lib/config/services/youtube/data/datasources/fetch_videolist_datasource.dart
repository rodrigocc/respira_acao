import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:respira_acao/config/services/youtube/data/models/video_list_model.dart';
import 'package:respira_acao/laboratory/secret.dart';

abstract class FetchYoutubeVideoListDataSource {
  Future<List<Video>> fetchVideoList(String playlistId);
}

class FetchYoutubeVideoListDataSourceImpl
    implements FetchYoutubeVideoListDataSource {
  @override
  Future<List<Video>> fetchVideoList(String playlistId) async {
    Map<String, dynamic> parameters = {
      "part": "snippet",
      "playlistId": playlistId,
      "maxResults": '10',
      "key": Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    Uri uri =
        Uri.https(Constants.BASE_URL, '/youtube/v3/playlistItems', parameters);
    final Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final VideoList videoList = videoListFromJson(response.body);

      return videoList.videos!;
    } else {
      throw Exception("Error");
    }
    // print(response.body);
  }
}
