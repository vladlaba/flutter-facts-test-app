import 'package:flutter_facts_test_app/random_fact/cubit/states/loading_random_fact_state.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/states/random_fact_state.dart';

export 'package:flutter_facts_test_app/random_fact/cubit/states/error_random_fact_state.dart';
export 'package:flutter_facts_test_app/random_fact/cubit/states/random_fact_state.dart';
export 'package:flutter_facts_test_app/random_fact/cubit/states/loaded_random_fact_state.dart';
export 'package:flutter_facts_test_app/random_fact/cubit/states/loading_random_fact_state.dart';
export 'package:flutter_facts_test_app/random_fact/cubit/states/uninitialized_random_fact_state.dart';

extension CanLoadNextFact on RandomFactState {
  bool get canLoadNext {
    return this is! LoadingRandomFactState;
  }
}
