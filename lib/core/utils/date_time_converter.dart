import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String? stringValue) =>
      stringValue == null || stringValue.isEmpty
          ? null
          : DateTime.fromMillisecondsSinceEpoch(int.parse(stringValue) * 1000);

  @override
  String? toJson(DateTime? date) {
    return date == null
        ? null
        : (date.millisecondsSinceEpoch ~/ 1000).toString();
  }
}
