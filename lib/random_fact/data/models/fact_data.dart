import 'package:equatable/equatable.dart';
import 'package:flutter_facts_test_app/common/data/converters/fact_date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact_data.g.dart';

@JsonSerializable()
class FactData extends Equatable {
  @LooseDateTimeConverter()
  final DateTime? createdAt;

  @JsonKey(name: 'fact')
  final String text;

  @override
  List<Object?> get props => [createdAt, text];

  const FactData(this.createdAt, this.text);

  factory FactData.fromJson(Map<String, dynamic> json) {
    return _$FactDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FactDataToJson(this);
}
