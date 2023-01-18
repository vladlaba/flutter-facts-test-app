import 'package:json_annotation/json_annotation.dart';

mixin DateTimeConverterMixin {
  DateTime? fromJson(int? json) {
    if (json == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(json);
  }

  int? toJson(DateTime? object) => object?.millisecondsSinceEpoch;
}

class LooseDateTimeConverter
    with DateTimeConverterMixin
    implements JsonConverter<DateTime?, int?> {
  const LooseDateTimeConverter();
}

class StrictDateTimeConverter
    with DateTimeConverterMixin
    implements JsonConverter<DateTime, int> {
  const StrictDateTimeConverter();

  @override
  DateTime fromJson(int? json) {
    ArgumentError.checkNotNull(json, 'milliseconds since epoch');
    return super.fromJson(json)!;
  }

  @override
  int toJson(DateTime? object) {
    ArgumentError.checkNotNull(object, 'date');
    return super.toJson(object)!;
  }
}
