import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable()
class Character {
  int? id;
  String? name, birthday, img, status, nickname, portrayed, category;
  List<String>? occupation;

  Character({
    this.id,
    this.name,
    this.birthday,
    this.img,
    this.status,
    this.nickname,
    this.portrayed,
    this.category,
    this.occupation,
  });

  factory Character.fromJson(Map<String, dynamic> data) =>
      _$CharacterFromJson(data);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
