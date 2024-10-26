// To parse this JSON data, do
//
//     final homeWallpapersData = homeWallpapersDataFromJson(jsonString);

import 'dart:convert';

HomeWallpapersData homeWallpapersDataFromJson(String str) =>
    HomeWallpapersData.fromJson(json.decode(str));

class HomeWallpapersData {
  List<Photo> photos;

  HomeWallpapersData({
    this.photos = const [],
  });

  factory HomeWallpapersData.fromJson(Map<String, dynamic> json) =>
      HomeWallpapersData(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );
}

class Photo {
  String id;
  String url;
  Src src;

  Photo({
    required this.id,
    required this.url,
    required this.src,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"].toString(),
        url: json["url"],
        src: Src.fromJson(json["src"]),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}

class Src {
  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
      );
}
