import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facts_test_app/common/data/repository/hive_storage_repository.dart';
import 'package:flutter_facts_test_app/common/environment/environment.dart';
import 'package:flutter_facts_test_app/common/router/router.dart';
import 'package:flutter_facts_test_app/common/services/date_time_formatter_service.dart';
import 'package:flutter_facts_test_app/facts_history/cubit/facts_history_cubit.dart';
import 'package:flutter_facts_test_app/facts_history/data/repository/facts_history_repository.dart';
import 'package:flutter_facts_test_app/facts_history/data/repository/hive_facts_history_repository.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/random_fact_cubit.dart';
import 'package:flutter_facts_test_app/random_fact/data/repository/random_fact_repository.dart';

class InjectorContainer extends StatefulWidget {
  final Widget child;

  const InjectorContainer({
    super.key,
    required this.child,
  });

  @override
  State<InjectorContainer> createState() => _InjectorContainerState();
}

class _InjectorContainerState extends State<InjectorContainer> {
  late final DateTimeFormatterService _formatterService;

  late final Dio _dio;
  late final HiveStorageRepository _hiveStorage;
  late final RandomFactRepository _randomFactRepository;
  late final FactsHistoryRepository _factsHistoryRepository;
  late final RandomFactCubit _randomFactCubit;
  late final FactsHistoryCubit _factsHistoryCubit;

  @override
  void initState() {
    _formatterService = const DateTimeFormatterService();

    _dio = Dio();
    _hiveStorage = HiveStorageRepository(
      Environment.factsBoxName,
    );

    _randomFactRepository = RandomFactRepository(_dio, _hiveStorage);
    _factsHistoryRepository = HiveFactsHistoryRepository(_hiveStorage);

    _randomFactCubit = RandomFactCubit(_randomFactRepository);
    _factsHistoryCubit = FactsHistoryCubit(_factsHistoryRepository);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RandomFactRepository>.value(
          value: _randomFactRepository,
        ),
        RepositoryProvider<FactsHistoryRepository>.value(
          value: _factsHistoryRepository,
        ),
        RepositoryProvider<FactsAppRouter>.value(
          value: const FactsAppRouter(),
        ),
        RepositoryProvider<DateTimeFormatterService>.value(
          value: _formatterService,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RandomFactCubit>.value(value: _randomFactCubit),
          BlocProvider<FactsHistoryCubit>.value(value: _factsHistoryCubit),
        ],
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _dio.close();

    _randomFactCubit.close();
    _factsHistoryCubit.close();

    super.dispose();
  }
}
