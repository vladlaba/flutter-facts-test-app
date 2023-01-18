import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/facts_history/page/facts_history_route_factory.dart';
import 'package:flutter_facts_test_app/random_fact/page/random_fact_route_factory.dart';

class FactsAppRouter with RandomFactRouterMixin, FactsHistoryRouterMixin {
  const FactsAppRouter();

  void back(BuildContext context) {
    final navigator = Navigator.of(context);

    if (navigator.canPop()) {
      return navigator.pop();
    }
  }
}
