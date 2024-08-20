import 'dart:convert';

EntertainmentNewsModel entertainmentNewsModelFromJson(String str) => EntertainmentNewsModel.fromJson(json.decode(str));

String entertainmentNewsModelToJson(EntertainmentNewsModel data) => json.encode(data.toJson());

class EntertainmentNewsModel {
  String status;
  List<Item2> items;

  EntertainmentNewsModel({
    required this.status,
    required this.items,
  });

  factory EntertainmentNewsModel.fromJson(Map<String, dynamic> json) => EntertainmentNewsModel(
    status: json["status"] ?? "",
    items: json["items"] == null ? [] : List<Item2>.from(json["items"].map((x) => Item2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item2 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item2>? subnews;

  Item2({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item2.fromJson(Map<String, dynamic> json) => Item2(
    title: json["title"] ?? "",
    snippet: json["snippet"] ?? "",
    publisher: json["publisher"] ?? "",
    timestamp: json["timestamp"] ?? "",
    newsUrl: json["newsUrl"] ?? "",
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null ? [] : List<Item2>.from(json["subnews"].map((x) => Item2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "snippet": snippet,
    "publisher": publisher,
    "timestamp": timestamp,
    "newsUrl": newsUrl,
    "images": images?.toJson(),
    "hasSubnews": hasSubnews,
    "subnews": subnews == null ? [] : List<dynamic>.from(subnews!.map((x) => x.toJson())),
  };
}

class Images {
  String thumbnail;
  String thumbnailProxied;

  Images({
    required this.thumbnail,
    required this.thumbnailProxied,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    thumbnail: json["thumbnail"] ?? "",
    thumbnailProxied: json["thumbnailProxied"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "thumbnailProxied": thumbnailProxied,
  };
}
