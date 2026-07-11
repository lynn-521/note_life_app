// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      steps: json['steps'] as String,
      servings: (json['servings'] as num?)?.toInt() ?? 1,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      authorId: json['authorId'] as String,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) =>
                  RecipeIngredientModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RecipeIngredientModel>[],
      cookableBy: (json['cookableBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'steps': instance.steps,
      'servings': instance.servings,
      'tags': instance.tags,
      'authorId': instance.authorId,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'cookableBy': instance.cookableBy,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
