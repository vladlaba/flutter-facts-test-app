import 'package:flutter/material.dart';

class LoadingErrorWidget extends StatelessWidget {
  final String message;

  const LoadingErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
          color: Colors.red,
        ),
      ),
    );
  }
}
