import 'package:animemangatoon/Model/characterModel.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class DetailsModel {
  @HiveField(0)
  final List<CharacterModel> characters;
  @HiveField(1)
  final String conclusion;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final double rating;

  DetailsModel({
    required this.characters,
    required this.conclusion,
    required this.status,
    required this.rating,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      characters: List<CharacterModel>.from(
          json['characters'].map((x) => CharacterModel.fromJson(x))),
      conclusion: json['conclusion'],
      status: json['status'],
      rating: json['rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'characters': List<dynamic>.from(characters.map((x) => x.toJson())),
      'conclusion': conclusion,
      'status': status,
      'rating': rating,
    };
  }
}
