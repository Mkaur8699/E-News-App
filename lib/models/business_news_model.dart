import 'dart:convert';

BusinessNewsModel businessNewsModelFromJson(String str) => BusinessNewsModel.fromJson(json.decode(str));

String businessNewsModelToJson(BusinessNewsModel data) => json.encode(data.toJson());

class BusinessNewsModel {
  String status;
  List<Item4> items;

  BusinessNewsModel({
    required this.status,
    required this.items,
  });

  factory BusinessNewsModel.fromJson(Map<String, dynamic> json) => BusinessNewsModel(
    status: json["status"],
    items: List<Item4>.from(json["items"].map((x) => Item4.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item4 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item4>? subnews;

  Item4({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item4.fromJson(Map<String, dynamic> json) => Item4(
    title: json["title"],
    snippet: json["snippet"],
    publisher: json["publisher"],
    timestamp: json["timestamp"],
    newsUrl: json["newsUrl"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null ? [] : List<Item4>.from(json["subnews"]!.map((x) => Item4.fromJson(x))),
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
