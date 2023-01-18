import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/random_fact_cubit.dart';
import 'package:flutter_facts_test_app/random_fact/strings/random_fact_page_strings.dart';

class AnotherFactButton extends StatelessWidget {
  final bool active;

  const AnotherFactButton({
    super.key,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<RandomFactCubit>().loadRandom();
      },
      child: const Text(RandomFactPageStrings.anotherFact),
    );
  }
}
