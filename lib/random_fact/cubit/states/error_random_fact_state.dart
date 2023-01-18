import 'package:flutter_facts_test_app/common/cubits/message_state.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/states/random_fact_state.dart';

class ErrorRandomFactState extends MessageState implements RandomFactState {
  const ErrorRandomFactState(super.errorMessage);
}
