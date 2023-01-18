import 'package:flutter_facts_test_app/common/cubits/message_state.dart';
import 'package:flutter_facts_test_app/facts_history/cubit/states/facts_history_state.dart';

class EmptyFactsHistoryState extends MessageState implements FactsHistoryState {
  const EmptyFactsHistoryState(super.message);
}
