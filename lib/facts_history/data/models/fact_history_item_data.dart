import 'package:equatable/equatable.dart';
import 'package:flutter_facts_test_app/common/data/converters/fact_date_time_converter.dart';

class FactHistoryItemData extends Equatable {
  static const _dateTimeConverter = StrictDateTimeConverter();

  final String id;
  final DateTime createdAt;
  final String text;

  const FactHistoryItemData(
    this.id,
    this.createdAt,
    this.text,
  );

  @override
  List<Object?> get props => [id, createdAt, text];

  factory FactHistoryItemData.fromJson(String id, Map<String, dynamic> json) {
    return FactHistoryItemData(
      id,
      _dateTimeConverter.fromJson(json['createdAt']),
      json['fact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': _dateTimeConverter.toJson(createdAt),
      'fact': text,
    };
  }
}
