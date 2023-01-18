import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/router/callable_route_factory.dart';
import 'package:flutter_facts_test_app/facts_history/page/facts_history_page.dart';

mixin FactsHistoryRouterMixin {
  Future<void> openFactsHistory(BuildContext context) {
    return Navigator.of(context).pushNamed(
      FactsHistoryRouteFactory.factsHistoryRouteName,
    );
  }
}

class FactsHistoryRouteFactory implements CallableRouteFactory<void> {
  static const String factsHistoryRouteName = '/facts_history';

  const FactsHistoryRouteFactory();

  @override
  Route<void>? call(RouteSettings settings) {
    final routeName = settings.name;

    if (routeName == factsHistoryRouteName) {
      return MaterialPageRoute(
        builder: (_) => const FactsHistoryPage(),
      );
    }

    return null;
  }
}
