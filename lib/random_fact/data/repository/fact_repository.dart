import 'package:flutter_facts_test_app/common/data/repository/repository_base.dart';
import 'package:flutter_facts_test_app/random_fact/data/models/fact_data.dart';

abstract class FactRepository extends RepositoryBase {
  const FactRepository();

  Future<FactData> loadRandom();

  Future<void> saveFact(String text, [DateTime? createdAt]);
}
