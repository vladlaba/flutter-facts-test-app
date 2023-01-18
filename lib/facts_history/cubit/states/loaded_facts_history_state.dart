import 'package:flutter_facts_test_app/common/view_models/fact_view_model.dart';
import 'package:flutter_facts_test_app/facts_history/cubit/states/facts_history_state.dart';

class LoadedFactsHistoryState extends FactsHistoryState {
  final List<FactViewModel> facts;

  const LoadedFactsHistoryState(this.facts);

  @override
  List<Object?> get props => [facts];
}
