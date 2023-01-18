import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/router/routes_generator.dart';
import 'package:flutter_facts_test_app/facts_history/page/facts_history_route_factory.dart';
import 'package:flutter_facts_test_app/random_fact/page/random_fact_page.dart';
import 'package:flutter_facts_test_app/random_fact/page/random_fact_route_factory.dart';

class FactsApp extends StatelessWidget {
  const FactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facts Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RoutesGenerator(
        defaultRoute: MaterialPageRoute(
          builder: (_) => const RandomFactPage(),
        ),
        delegates: const [
          RandomFactRouteFactory(),
          FactsHistoryRouteFactory(),
        ],
      ),
      initialRoute: RandomFactRouteFactory.randomFactRouteName,
    );
  }
}
