// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactData _$FactDataFromJson(Map<String, dynamic> json) => FactData(
      const LooseDateTimeConverter().fromJson(json['createdAt'] as int?),
      json['fact'] as String,
    );

Map<String, dynamic> _$FactDataToJson(FactData instance) => <String, dynamic>{
      'createdAt': const LooseDateTimeConverter().toJson(instance.createdAt),
      'fact': instance.text,
    };
