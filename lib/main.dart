import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/app/facts_app.dart';
import 'package:flutter_facts_test_app/common/widgets/injector_container.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  EquatableConfig.stringify = true;

  await Hive.initFlutter();

  runApp(
    const InjectorContainer(
      child: FactsApp(),
    ),
  );
}
