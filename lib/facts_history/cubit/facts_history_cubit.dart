import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facts_test_app/common/view_models/fact_view_model.dart';
import 'package:flutter_facts_test_app/facts_history/cubit/facts_history_states.dart';
import 'package:flutter_facts_test_app/facts_history/data/models/fact_history_item_data.dart';
import 'package:flutter_facts_test_app/facts_history/data/repository/facts_history_repository.dart';
import 'package:flutter_facts_test_app/facts_history/strings/facts_history_page_strings.dart';

class FactsHistoryCubit extends Cubit<FactsHistoryState> {
  final FactsHistoryRepository _repository;

  FactsHistoryCubit(
    this._repository,
  ) : super(const UninitializedFactsHistoryState());

  void loadHistory() async {
    if (state is LoadingFactsHistoryState) return;

    if (state is UninitializedFactsHistoryState) {
      await _repository.prepare();
      emit(const LoadingFactsHistoryState());
    }

    try {
      final facts = await _repository.loadHistory();

      if (facts.isEmpty) {
        emit(const EmptyFactsHistoryState(
          FactsHistoryPageStrings.historyIsEmpty,
        ));
      } else {
        _emitLoaded(facts);
      }
    } catch (e) {
      // todo handle and log errors
      emit(const ErrorFactsHistoryState(
        FactsHistoryPageStrings.errorLoadingHistory,
      ));
    }
  }

  void _emitLoaded(List<FactHistoryItemData> facts) {
    final viewModels = facts.map(_mapItem).toList();

    emit(LoadedFactsHistoryState(viewModels));
  }

  FactViewModel _mapItem(FactHistoryItemData item) {
    return FactViewModel(
      factText: item.text,
      createdAt: item.createdAt,
    );
  }

  @override
  Future<void> close() async {
    await _repository.release();
    return super.close();
  }
}
