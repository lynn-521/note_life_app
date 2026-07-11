// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyMealImpl _$$DailyMealImplFromJson(Map<String, dynamic> json) =>
    _$DailyMealImpl(
      id: json['id'] as String,
      date: const UtcDateTimeConverter().fromJson(json['date'] as String),
      mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
      recipeId: json['recipeId'] as String,
      createdAt:
          const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const UtcDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$DailyMealImplToJson(_$DailyMealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': const UtcDateTimeConverter().toJson(instance.date),
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'recipeId': instance.recipeId,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'version': instance.version,
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const UtcDateTimeConverter().toJson),
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.snack: 'snack',
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
