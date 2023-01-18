import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/router/callable_route_factory.dart';
import 'package:flutter_facts_test_app/random_fact/page/random_fact_page.dart';

mixin RandomFactRouterMixin {
  Future<void> openRandomFact(BuildContext context) {
    return Navigator.of(context).pushNamed(
      RandomFactRouteFactory.randomFactRouteName,
    );
  }
}

class RandomFactRouteFactory implements CallableRouteFactory<void> {
  static const String randomFactRouteName = '/';

  const RandomFactRouteFactory();

  @override
  Route<void>? call(RouteSettings settings) {
    final routeName = settings.name;

    if (routeName == randomFactRouteName) {
      return MaterialPageRoute(
        builder: (_) => const RandomFactPage(),
      );
    }

    return null;
  }
}
