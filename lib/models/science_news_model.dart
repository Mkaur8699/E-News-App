import 'dart:convert';

ScienceNewsModel scienceNewsModelFromJson(String str) => ScienceNewsModel.fromJson(json.decode(str));

String scienceNewsModelToJson(ScienceNewsModel data) => json.encode(data.toJson());

class ScienceNewsModel {
  String status;
  List<Item7> items;

  ScienceNewsModel({
    required this.status,
    required this.items,
  });

  factory ScienceNewsModel.fromJson(Map<String, dynamic> json) => ScienceNewsModel(
    status: json["status"] ?? "",
    items: json["items"] == null
        ? []
        : List<Item7>.from(json["items"].map((x) => Item7.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item7 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images images;
  bool? hasSubnews;
  List<Item7>? subnews;

  Item7({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    required this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item7.fromJson(Map<String, dynamic> json) => Item7(
    title: json["title"] ?? "",
    snippet: json["snippet"] ?? "",
    publisher: json["publisher"] ?? "",
    timestamp: json["timestamp"] ?? "",
    newsUrl: json["newsUrl"] ?? "",
    images: Images.fromJson(json["images"] ?? {}),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null
        ? []
        : List<Item7>.from(json["subnews"].map((x) => Item7.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "snippet": snippet,
    "publisher": publisher,
    "timestamp": timestamp,
    "newsUrl": newsUrl,
    "images": images.toJson(),
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
