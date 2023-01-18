import 'package:flutter/material.dart';

class FactDetails extends StatelessWidget {
  final String createdAtFormatted;
  final String text;

  const FactDetails({
    super.key,
    required this.createdAtFormatted,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            createdAtFormatted,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Align(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
