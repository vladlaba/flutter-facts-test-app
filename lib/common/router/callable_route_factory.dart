import 'package:flutter/material.dart';

/// Interface that provides behavior for route creating. Matches the
/// [RouteFactory] signature to be used within [MaterialApp.onGenerateRoute].
abstract class CallableRouteFactory<T> {
  const CallableRouteFactory();

  Route<T>? call(RouteSettings settings);
}
