import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/cat_facts/page/cats_facts_page.dart';

class FactsApp extends StatelessWidget {
  const FactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facts Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CatFactsPage(),
    );
  }
}
