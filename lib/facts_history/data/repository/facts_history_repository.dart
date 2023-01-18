import 'package:flutter_facts_test_app/common/data/repository/repository_base.dart';
import 'package:flutter_facts_test_app/facts_history/data/models/fact_history_item_data.dart';

abstract class FactsHistoryRepository extends RepositoryBase {
  const FactsHistoryRepository();

  Future<List<FactHistoryItemData>> loadHistory();
}
