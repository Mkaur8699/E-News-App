import 'dart:convert';

HealthNewsModel healthNewsModelFromJson(String str) => HealthNewsModel.fromJson(json.decode(str));

String healthNewsModelToJson(HealthNewsModel data) => json.encode(data.toJson());

class HealthNewsModel {
  String status;
  List<Item5> items;

  HealthNewsModel({
    required this.status,
    required this.items,
  });

  factory HealthNewsModel.fromJson(Map<String, dynamic> json) => HealthNewsModel(
    status: json["status"] ?? "",
    items: json["items"] == null
        ? []
        : List<Item5>.from(json["items"].map((x) => Item5.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item5 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item5>? subnews;

  Item5({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item5.fromJson(Map<String, dynamic> json) => Item5(
    title: json["title"] ?? "",
    snippet: json["snippet"] ?? "",
    publisher: json["publisher"] ?? "",
    timestamp: json["timestamp"] ?? "",
    newsUrl: json["newsUrl"] ?? "",
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null
        ? []
        : List<Item5>.from(json["subnews"].map((x) => Item5.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "snippet": snippet,
    "publisher": publisher,
    "timestamp": timestamp,
    "newsUrl": newsUrl,
    "images": images?.toJson(),
    "hasSubnews": hasSubnews,
    "subnews": subnews == null
        ? []
        : List<dynamic>.from(subnews!.map((x) => x.toJson())),
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
