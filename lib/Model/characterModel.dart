import 'package:hive/hive.dart';

part 'characterModel.g.dart';

@HiveType(typeId: 2)
class CharacterModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String image;

  CharacterModel({
    required this.name,
    required this.description,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
