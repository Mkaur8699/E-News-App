import 'dart:convert';

// Function to convert JSON string to WorldNewsModel
WorldNewsModel worldNewsModelFromJson(String str) => WorldNewsModel.fromJson(json.decode(str));

// Function to convert WorldNewsModel to JSON string
String worldNewsModelToJson(WorldNewsModel data) => json.encode(data.toJson());

class WorldNewsModel {
  String status;
  List<Item3> items;

  WorldNewsModel({
    required this.status,
    required this.items,
  });

  factory WorldNewsModel.fromJson(Map<String, dynamic> json) => WorldNewsModel(
    status: json["status"] ?? "",
    items: json["items"] == null
        ? []
        : List<Item3>.from(json["items"].map((x) => Item3.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item3 {
  String title;
  String snippet;
  String publisher;
  String timestamp;
  String newsUrl;
  Images images;
  bool? hasSubnews;
  List<Item3>? subnews;

  Item3({
    required this.title,
    required this.snippet,
    required this.publisher,
    required this.timestamp,
    required this.newsUrl,
    required this.images,
    this.hasSubnews,
    this.subnews,
  });

  factory Item3.fromJson(Map<String, dynamic> json) => Item3(
    title: json["title"] ?? "",
    snippet: json["snippet"] ?? "",
    publisher: json["publisher"] ?? "",
    timestamp: json["timestamp"] ?? "",
    newsUrl: json["newsUrl"] ?? "",
    images: Images.fromJson(json["images"] ?? {}),
    hasSubnews: json["hasSubnews"],
    subnews: json["subnews"] == null
        ? []
        : List<Item3>.from(json["subnews"].map((x) => Item3.fromJson(x))),
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
