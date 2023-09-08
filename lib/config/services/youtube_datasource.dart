import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:respira_acao/config/services/youtube/data/models/playlistst_model.dart';
import 'package:respira_acao/config/services/youtube/data/models/video_model.dart';
import 'package:respira_acao/laboratory/secret.dart';

import 'youtube/data/models/channel_info_model.dart';

class YoutubeDatasource {
  // curl \
  // 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UC_x5XG1OV2P6uZZ5FSM9Ttw&maxResults=10&access_token=AIzaSyCDA_NOPjTp8BZOshnHPFFlab3STQw44HE&key=[YOUR_API_KEY]' \
  // --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  // --header 'Accept: application/json' \
  // --compressed

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, dynamic> parameters = {
      "part": "snippet,contentDetails,statistics",
      "id": Constants.CHANNEL_ID,
      "key": Constants.API_KEY,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    Uri uri = Uri.https(Constants.BASE_URL, '/youtube/v3/channels', parameters);

    final Response response = await http.get(uri, headers: headers);
    print(response.body);

    final ChannelInfo channelInfo = channelInfoFromJson(response.body);

    return channelInfo;
  }

  static Future<Playlist> getPlaylistsFromChannelId() async {
    Map<String, dynamic> parameters = {
      "part": "snippet,contentDetails",
      "channelId": Constants.CHANNEL_ID,
      "maxResults": 10,
      "key": Constants.API_KEY,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    Uri uri = Uri.http(Constants.BASE_URL, '/youtube/v3/playlist', parameters);

    final Response response = await http.get(uri, headers: headers);
    print(response.body);

    final Playlist playlist = playlistFromJson(response.body);

    return playlist;
  }

  static Future<VideoModel> getVideoListsFromChannelId() async {
    Map<String, dynamic> parameters = {
      "part": "snippet",
      "channelId": Constants.CHANNEL_ID,
      "maxResults": 10,
      "key": Constants.API_KEY,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    Uri uri = Uri.http(Constants.BASE_URL, '/youtube/v3/channels', parameters);

    final Response response = await http.get(uri, headers: headers);

    print(response.body);

    final VideoModel videoModel = videoModelFromJson(response.body);

    return videoModel;
  }
}
