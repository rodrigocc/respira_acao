// // To parse this JSON data, do
// //
// //     final playlistByIdModel = playlistByIdModelFromJson(jsonString);

// import 'dart:convert';

// PlaylistByIdModel playlistByIdModelFromJson(String str) =>
//     PlaylistByIdModel.fromJson(json.decode(str));

// String playlistByIdModelToJson(PlaylistByIdModel data) =>
//     json.encode(data.toJson());

// class PlaylistByIdModel {
//   String kind;
//   String etag;
//   List<Video> videos;
//   PageInfo pageInfo;

//   PlaylistByIdModel({
//     required this.kind,
//     required this.etag,
//     required this.videos,
//     required this.pageInfo,
//   });

//   factory PlaylistByIdModel.fromJson(Map<String, dynamic> json) =>
//       PlaylistByIdModel(
//         kind: json["kind"],
//         etag: json["etag"],
//         videos: List<Video>.from(json["items"].map((x) => Video.fromJson(x))),
//         pageInfo: PageInfo.fromJson(json["pageInfo"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "kind": kind,
//         "etag": etag,
//         "items": List<dynamic>.from(videos.map((x) => x.toJson())),
//         "pageInfo": pageInfo.toJson(),
//       };
// }

// class Video {
//   String kind;
//   String etag;
//   String id;
//   Snippet snippet;
//   ContentDetails contentDetails;

//   Video({
//     required this.kind,
//     required this.etag,
//     required this.id,
//     required this.snippet,
//     required this.contentDetails,
//   });

//   factory Video.fromJson(Map<String, dynamic> json) => Video(
//         kind: json["kind"],
//         etag: json["etag"],
//         id: json["id"],
//         snippet: Snippet.fromJson(json["snippet"]),
//         contentDetails: ContentDetails.fromJson(json["contentDetails"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "kind": kind,
//         "etag": etag,
//         "id": id,
//         "snippet": snippet.toJson(),
//         "contentDetails": contentDetails.toJson(),
//       };
// }

// class ContentDetails {
//   String videoId;
//   DateTime videoPublishedAt;

//   ContentDetails({
//     required this.videoId,
//     required this.videoPublishedAt,
//   });

//   factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
//         videoId: json["videoId"],
//         videoPublishedAt: DateTime.parse(json["videoPublishedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "videoId": videoId,
//         "videoPublishedAt": videoPublishedAt.toIso8601String(),
//       };
// }

// class Snippet {
//   DateTime publishedAt;
//   String channelId;
//   String title;
//   String description;
//   Thumbnails thumbnails;
//   String channelTitle;
//   String playlistId;
//   int position;
//   ResourceId resourceId;
//   String videoOwnerChannelTitle;
//   String videoOwnerChannelId;

//   Snippet({
//     required this.publishedAt,
//     required this.channelId,
//     required this.title,
//     required this.description,
//     required this.thumbnails,
//     required this.channelTitle,
//     required this.playlistId,
//     required this.position,
//     required this.resourceId,
//     required this.videoOwnerChannelTitle,
//     required this.videoOwnerChannelId,
//   });

//   factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         channelId: json["channelId"],
//         title: json["title"],
//         description: json["description"],
//         thumbnails: Thumbnails.fromJson(json["thumbnails"]),
//         channelTitle: json["channelTitle"],
//         playlistId: json["playlistId"],
//         position: json["position"],
//         resourceId: ResourceId.fromJson(json["resourceId"]),
//         videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
//         videoOwnerChannelId: json["videoOwnerChannelId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "publishedAt": publishedAt.toIso8601String(),
//         "channelId": channelId,
//         "title": title,
//         "description": description,
//         "thumbnails": thumbnails.toJson(),
//         "channelTitle": channelTitle,
//         "playlistId": playlistId,
//         "position": position,
//         "resourceId": resourceId.toJson(),
//         "videoOwnerChannelTitle": videoOwnerChannelTitle,
//         "videoOwnerChannelId": videoOwnerChannelId,
//       };
// }

// class ResourceId {
//   String kind;
//   String videoId;

//   ResourceId({
//     required this.kind,
//     required this.videoId,
//   });

//   factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
//         kind: json["kind"],
//         videoId: json["videoId"],
//       );

//   Map<String, dynamic> toJson() => {
//         "kind": kind,
//         "videoId": videoId,
//       };
// }

// class Thumbnails {
//   Default thumbnailsDefault;
//   Default medium;
//   Default high;
//   Default standard;
//   Default? maxres;

//   Thumbnails({
//     required this.thumbnailsDefault,
//     required this.medium,
//     required this.high,
//     required this.standard,
//     this.maxres,
//   });

//   factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
//         thumbnailsDefault: Default.fromJson(json["default"]),
//         medium: Default.fromJson(json["medium"]),
//         high: Default.fromJson(json["high"]),
//         standard: Default.fromJson(json["standard"]),
//         maxres:
//             json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "default": thumbnailsDefault.toJson(),
//         "medium": medium.toJson(),
//         "high": high.toJson(),
//         "standard": standard.toJson(),
//         "maxres": maxres?.toJson(),
//       };
// }

// class Default {
//   String url;
//   int width;
//   int height;

//   Default({
//     required this.url,
//     required this.width,
//     required this.height,
//   });

//   factory Default.fromJson(Map<String, dynamic> json) => Default(
//         url: json["url"],
//         width: json["width"],
//         height: json["height"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "width": width,
//         "height": height,
//       };
// }

// class PageInfo {
//   int totalResults;
//   int resultsPerPage;

//   PageInfo({
//     required this.totalResults,
//     required this.resultsPerPage,
//   });

//   factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
//         totalResults: json["totalResults"],
//         resultsPerPage: json["resultsPerPage"],
//       );

//   Map<String, dynamic> toJson() => {
//         "totalResults": totalResults,
//         "resultsPerPage": resultsPerPage,
//       };
// }
