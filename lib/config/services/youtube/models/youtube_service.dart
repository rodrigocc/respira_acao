import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:respira_acao/laboratory/secret.dart';

import 'channel_info_model.dart';

class YouTubeService {
  final String apiKey = "AIzaSyCDA_NOPjTp8BZOshnHPFFlab3STQw44HE";
  static const _baseUrl = "www.googleapis.com";
  static const CHANNEL_ID = "UCNXzMu9TL1DgjIpo0_7TUAQ";

  // curl \
  // 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UC_x5XG1OV2P6uZZ5FSM9Ttw&maxResults=10&access_token=AIzaSyCDA_NOPjTp8BZOshnHPFFlab3STQw44HE&key=[YOUR_API_KEY]' \
  // --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  // --header 'Accept: application/json' \
  // --compressed

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, dynamic> parameters = {
      "part": "snippet,contentDetails,statistics",
      "id": CHANNEL_ID,
      "key": Constants.API_KEY,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    Uri uri = Uri.http(_baseUrl, '/youtube/v3/channels', parameters);

    final Response response = await http.get(uri, headers: headers);
    print(response.body);

    final ChannelInfo channelInfo = channelInfoFromJson(response.body);

    return channelInfo;
  }
}
