import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable()
class Character {
  int? id;
  String? name, birthday, img, status, nickname, portrayed, category;
  List<String>? occupation;

  Character({
    required this.id,
    required this.name,
    required this.birthday,
    required this.img,
    required this.status,
    required this.nickname,
    required this.portrayed,
    required this.category,
    required this.occupation,
  });

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
