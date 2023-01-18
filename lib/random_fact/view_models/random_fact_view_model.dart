import 'package:flutter_facts_test_app/common/view_models/fact_view_model.dart';

class RandomFactViewModel extends FactViewModel {
  final String imageUrl;

  const RandomFactViewModel({
    required this.imageUrl,
    required super.factText,
    required super.createdAt,
  });

  @override
  List<Object?> get props => [imageUrl, ...super.props];
}
