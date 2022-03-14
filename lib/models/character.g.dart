// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      img: json['img'] as String?,
      status: json['status'] as String?,
      nickname: json['nickname'] as String?,
      portrayed: json['portrayed'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'img': instance.img,
      'status': instance.status,
      'nickname': instance.nickname,
      'portrayed': instance.portrayed,
      'category': instance.category,
    };
