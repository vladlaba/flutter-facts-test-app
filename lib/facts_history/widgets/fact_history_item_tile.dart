import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/services/date_time_formatter_service.dart';
import 'package:flutter_facts_test_app/common/view_models/fact_view_model.dart';

class FactHistoryItemTile extends StatelessWidget {
  final bool grayed;
  final FactViewModel fact;

  const FactHistoryItemTile({
    super.key,
    required this.fact,
    this.grayed = false,
  });

  @override
  Widget build(BuildContext context) {
    final createdAt = context.formatDate(fact.createdAt);

    return ListTile(
      tileColor: grayed ? Colors.black12 : null,
      title: Text(fact.factText),
      subtitle: Text(
        createdAt,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
