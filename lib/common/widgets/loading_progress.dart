import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  final double? value;

  const LoadingProgress({
    super.key,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 80.0,
      child: CircularProgressIndicator(
        strokeWidth: 8.0,
        value: value,
      ),
    );
  }
}
