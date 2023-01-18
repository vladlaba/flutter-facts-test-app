import 'package:flutter_facts_test_app/random_fact/cubit/states/random_fact_state.dart';
import 'package:flutter_facts_test_app/random_fact/view_models/random_fact_view_model.dart';

class LoadedRandomFactState extends RandomFactState {
  final RandomFactViewModel randomFactViewModel;

  const LoadedRandomFactState(
    this.randomFactViewModel,
  );

  @override
  List<Object?> get props => [randomFactViewModel];
}
