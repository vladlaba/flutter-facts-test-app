import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/router/callable_route_factory.dart';

class RoutesGenerator implements CallableRouteFactory {
  final Route defaultRoute;
  final List<CallableRouteFactory> delegates;

  const RoutesGenerator({
    required this.defaultRoute,
    this.delegates = const [],
  });

  @override
  Route<void>? call(RouteSettings settings) {
    for (final delegate in delegates) {
      final route = delegate(settings);

      if (route != null) return route;
    }

    return defaultRoute;
  }
}
