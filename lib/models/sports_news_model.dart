import 'dart:convert';

SportsNewsModel sportsNewsModelFromJson(String str) => SportsNewsModel.fromJson(json.decode(str));

String sportsNewsModelToJson(SportsNewsModel data) => json.encode(data.toJson());

class SportsNewsModel {
  String status;
  List<Item6> items;

  SportsNewsModel({
    required this.status,
    required this.items,
  });

  factory SportsNewsModel.fromJson(Map<String, dynamic> json) => SportsNewsModel(
    status: json["status"],
    items: List<Item6>.from(json["items"].map((x) => Item6.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item6 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item6>? subnews;

  Item6({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item6.fromJson(Map<String, dynamic> json) => Item6(
    title: json["title"],
    snippet: json["snippet"],
    publisher: json["publisher"],
    timestamp: json["timestamp"],
    newsUrl: json["newsUrl"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null ? [] : List<Item6>.from(json["subnews"]!.map((x) => Item6.fromJson(x))),
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
    thumbnail: json["thumbnail"],
    thumbnailProxied: json["thumbnailProxied"],
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "thumbnailProxied": thumbnailProxied,
  };
}
