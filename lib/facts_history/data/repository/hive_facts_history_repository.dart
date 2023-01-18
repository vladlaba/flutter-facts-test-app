import 'package:flutter_facts_test_app/common/data/repository/hive_storage_repository.dart';
import 'package:flutter_facts_test_app/facts_history/data/models/fact_history_item_data.dart';
import 'package:flutter_facts_test_app/facts_history/data/repository/facts_history_repository.dart';

class HiveFactsHistoryRepository implements FactsHistoryRepository {
  final HiveStorageRepository _hiveStorage;

  HiveFactsHistoryRepository(this._hiveStorage);

  @override
  Future<void> prepare() async {
    await _hiveStorage.prepare();
  }

  @override
  Future<List<FactHistoryItemData>> loadHistory() async {
    final values = await _hiveStorage.getAll();
    final facts = values.map(_mapHiveObject).toList();

    return facts;
  }

  @override
  Future<void> release() async {
    await _hiveStorage.release();
  }

  FactHistoryItemData _mapHiveObject(HiveObjectData hiveObject) {
    return FactHistoryItemData.fromJson(hiveObject.key, hiveObject.value);
  }
}
