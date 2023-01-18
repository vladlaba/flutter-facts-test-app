import 'package:equatable/equatable.dart';

class FactViewModel extends Equatable {
  final String factText;
  final DateTime createdAt;

  const FactViewModel({
    required this.factText,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [factText, createdAt];
}
