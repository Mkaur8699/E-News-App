import 'dart:convert';

TechnologyNewsModel technologyNewsModelFromJson(String str) => TechnologyNewsModel.fromJson(json.decode(str));

String technologyNewsModelToJson(TechnologyNewsModel data) => json.encode(data.toJson());

class TechnologyNewsModel {
  String status;
  List<Item8> items;

  TechnologyNewsModel({
    required this.status,
    required this.items,
  });

  factory TechnologyNewsModel.fromJson(Map<String, dynamic> json) => TechnologyNewsModel(
    status: json["status"],
    items: List<Item8>.from(json["items"].map((x) => Item8.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item8 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item8>? subnews;

  Item8({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item8.fromJson(Map<String, dynamic> json) => Item8(
    title: json["title"],
    snippet: json["snippet"],
    publisher: json["publisher"],
    timestamp: json["timestamp"],
    newsUrl: json["newsUrl"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null ? [] : List<Item8>.from(json["subnews"]!.map((x) => Item8.fromJson(x))),
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
