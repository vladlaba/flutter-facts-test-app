import 'package:flutter/material.dart';
import 'package:flutter_facts_test_app/common/widgets/loading_progress.dart';

class FactImage extends StatelessWidget {
  final String imageUrl;

  const FactImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      filterQuality: FilterQuality.medium,
      loadingBuilder: (_, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        final loaded = loadingProgress.cumulativeBytesLoaded;
        final expected = loadingProgress.expectedTotalBytes;

        final value = expected != null ? loaded / expected : null;

        return Center(
          child: LoadingProgress(
            value: value,
          ),
        );
      },
      errorBuilder: (context, Object exception, StackTrace? stackTrace) {
        return const Text('ðmmmm¢');
      },
    );
  }
}
