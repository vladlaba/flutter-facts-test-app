import 'package:dio/dio.dart';
import 'package:flutter_facts_test_app/common/data/repository/hive_storage_repository.dart';
import 'package:flutter_facts_test_app/common/environment/environment.dart';
import 'package:flutter_facts_test_app/random_fact/data/models/fact_data.dart';
import 'package:flutter_facts_test_app/random_fact/data/repository/fact_repository.dart';
import 'package:retrofit/retrofit.dart';
import 'package:uuid/uuid.dart';

part 'random_fact_repository.g.dart';

class RandomFactRepository implements FactRepository {
  final RandomFactApi _randomFactApi;
  final HiveStorageRepository _hiveStorage;
  final Uuid _uuid;

  RandomFactRepository(
    Dio dio,
    this._hiveStorage, [
    this._uuid = const Uuid(),
  ]) : _randomFactApi = RandomFactApi(dio);

  @override
  Future<void> prepare() async {
    await _hiveStorage.prepare();
  }

  @override
  Future<FactData> loadRandom() {
    return _randomFactApi.loadFact();
  }

  @override
  Future<void> release() async {
    await _hiveStorage.prepare();
  }

  @override
  Future<void> saveFact(String text, [DateTime? createdAt]) async {
    final item = FactData(
      createdAt ?? DateTime.now(),
      text,
    );

    await _hiveStorage.save(_uuid.v4(), item.toJson());
  }
}

@RestApi(baseUrl: Environment.factsApiBaseUrl)
abstract class RandomFactApi {
  factory RandomFactApi(
    Dio dio, {
    String baseUrl,
  }) = _RandomFactApi;

  @GET('/fact')
  Future<FactData> loadFact();
}
