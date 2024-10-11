import 'package:animemangatoon/Model/detailsModel.dart';
import 'package:hive/hive.dart';

part 'animeWebToonsModel.g.dart';

@HiveType(typeId: 0)
class AnimeWebToonsModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String creator;
  @HiveField(5)
  final String genre;
  @HiveField(6)
  final DetailsModel details;

  AnimeWebToonsModel({
    required this.title,
    required this.image,
    required this.url,
    required this.description,
    required this.creator,
    required this.genre,
    required this.details,
  });

  factory AnimeWebToonsModel.fromJson(Map<String, dynamic> json) {
    return AnimeWebToonsModel(
      title: json['title'],
      image: json['image'],
      url: json['url'],
      description: json['description'],
      creator: json['creator'],
      genre: json['genre'],
      details: DetailsModel.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'url': url,
      'description': description,
      'creator': creator,
      'genre': genre,
      'details': details.toJson(),
    };
  }
}
