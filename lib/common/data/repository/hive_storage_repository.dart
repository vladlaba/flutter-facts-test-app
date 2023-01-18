import 'package:equatable/equatable.dart';
import 'package:flutter_facts_test_app/common/data/repository/repository_base.dart';
import 'package:hive/hive.dart';

class HiveObjectData extends Equatable {
  final String key;
  final Map<String, dynamic> value;

  @override
  List<Object?> get props => [key, value];

  const HiveObjectData(this.key, this.value);
}

class HiveStorageRepository implements RepositoryBase {
  final String boxName;

  Box<Map>? _box;

  HiveStorageRepository(
    this.boxName,
  );

  @override
  Future<void> prepare() async {
    _box = await Hive.openBox<Map>(boxName);
  }

  Future<List<HiveObjectData>> getAll() async {
    final box = _checkBox();

    final values = box.toMap();
    final facts = values.entries.map(_mapBoxEntry).toList();

    return facts;
  }

  Future<void> save(String key, Map<String, dynamic> value) async {
    final box = _checkBox();

    await box.put(key, value);
    await box.flush();
  }

  Box<Map> _checkBox() {
    if (_box == null) {
      throw HiveError('Box is not ready.');
    }

    return _box!;
  }

  HiveObjectData _mapBoxEntry(
    MapEntry<dynamic, Map<dynamic, dynamic>> entry,
  ) {
    return HiveObjectData(
      entry.key.toString(),
      Map<String, dynamic>.from(entry.value),
    );
  }

  @override
  Future<void> release() async {
    await _box?.flush();
    _box?.close();
  }
}
