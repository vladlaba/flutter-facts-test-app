import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/services/date_time_formatter_service.dart';
import 'package:flutter_facts_test_app/random_fact/view_models/random_fact_view_model.dart';
import 'package:flutter_facts_test_app/random_fact/widgets/fact_details.dart';
import 'package:flutter_facts_test_app/random_fact/widgets/fact_image.dart';

class FactCard extends StatelessWidget {
  final RandomFactViewModel fact;

  const FactCard({
    super.key,
    required this.fact,
  });

  @override
  Widget build(BuildContext context) {
    final createdAt = context.formatDate(fact.createdAt);

    return Card(
      margin: EdgeInsets.zero,
      elevation: 2.0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FactImage(
                  imageUrl: fact.imageUrl,
                ),
              ),
            ),
            FactDetails(
              text: fact.factText,
              createdAtFormatted: createdAt,
            ),
          ],
        ),
      ),
    );
  }
}
