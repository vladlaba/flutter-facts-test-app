import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facts_test_app/common/environment/environment.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/random_fact_states.dart';
import 'package:flutter_facts_test_app/random_fact/data/models/fact_data.dart';
import 'package:flutter_facts_test_app/random_fact/data/repository/fact_repository.dart';
import 'package:flutter_facts_test_app/random_fact/strings/random_fact_page_strings.dart';
import 'package:flutter_facts_test_app/random_fact/view_models/random_fact_view_model.dart';

class RandomFactCubit extends Cubit<RandomFactState> {
  final FactRepository _repository;

  RandomFactCubit(
    this._repository,
  ) : super(const UninitializedRandomFactState());

  void loadRandom() async {
    final state = this.state;

    if (state is LoadingRandomFactState) return;

    emit(const LoadingRandomFactState());
    if (state is UninitializedRandomFactState) {
      await _repository.prepare();
    }

    try {
      final fact = await _repository.loadRandom();
      _emitLoaded(fact);
    } catch (e) {
      // todo handle and log errors
      emit(const ErrorRandomFactState(RandomFactPageStrings.errorLoading));
    }
  }

  void _emitLoaded(FactData fact) {
    final now = DateTime.now();
    final createdAt = fact.createdAt ?? now;

    final viewModel = RandomFactViewModel(
      imageUrl: '${Environment.imagesBaseUrl}?${now.millisecondsSinceEpoch}',
      factText: fact.text,
      createdAt: createdAt,
    );

    emit(LoadedRandomFactState(viewModel));

    _saveLoaded(fact.text, createdAt);
  }

  void _saveLoaded(String text, DateTime createdAt) {
    _repository.saveFact(text, createdAt);
  }

  @override
  Future<void> close() async {
    await _repository.release();
    return super.close();
  }
}
