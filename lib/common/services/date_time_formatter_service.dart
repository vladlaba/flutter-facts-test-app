import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateTimeFormatterService {
  const DateTimeFormatterService();

  String format(DateTime date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}

extension DateFormating on BuildContext {
  String formatDate(DateTime date) {
    return read<DateTimeFormatterService>().format(date);
  }
}
