import 'dart:convert';

GoogleNewsModel googleNewsModelFromJson(String str) => GoogleNewsModel.fromJson(json.decode(str));

String googleNewsModelToJson(GoogleNewsModel data) => json.encode(data.toJson());

class GoogleNewsModel {
  String status;
  List<Item> items;

  GoogleNewsModel({
    required this.status,
    required this.items,
  });

  factory GoogleNewsModel.fromJson(Map<String, dynamic> json) => GoogleNewsModel(
    status: json["status"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images? images;
  bool? hasSubnews;
  List<Item>? subnews;

  Item({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"],
    snippet: json["snippet"],
    publisher: json["publisher"],
    timestamp: json["timestamp"],
    newsUrl: json["newsUrl"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null ? [] : List<Item>.from(json["subnews"]!.map((x) => Item.fromJson(x))),
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
