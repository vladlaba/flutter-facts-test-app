import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/view_models/fact_view_model.dart';
import 'package:flutter_facts_test_app/facts_history/widgets/fact_history_item_tile.dart';

class FactHistoryListView extends StatelessWidget {
  final List<FactViewModel> facts;

  const FactHistoryListView({
    super.key,
    required this.facts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      itemCount: facts.length,
      itemBuilder: (context, index) {
        return FactHistoryItemTile(
          grayed: index % 2 != 0,
          fact: facts[index],
        );
      },
    );
  }
}
