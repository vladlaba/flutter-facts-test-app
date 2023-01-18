import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facts_test_app/common/router/router.dart';
import 'package:flutter_facts_test_app/common/widgets/loading_error_widget.dart';
import 'package:flutter_facts_test_app/common/widgets/loading_progress.dart';
import 'package:flutter_facts_test_app/common/widgets/nothing_display_widget.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/random_fact_cubit.dart';
import 'package:flutter_facts_test_app/random_fact/cubit/random_fact_states.dart';
import 'package:flutter_facts_test_app/random_fact/strings/random_fact_page_strings.dart';
import 'package:flutter_facts_test_app/random_fact/widgets/another_fact_button.dart';
import 'package:flutter_facts_test_app/random_fact/widgets/fact_card.dart';

class RandomFactPage extends StatefulWidget {
  const RandomFactPage({super.key});

  @override
  State<RandomFactPage> createState() => _RandomFactPageState();
}

class _RandomFactPageState extends State<RandomFactPage> {
  @override
  void initState() {
    context.read<RandomFactCubit>().loadRandom();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RandomFactPageStrings.pageTitle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<FactsAppRouter>().openFactsHistory(context);
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<RandomFactCubit, RandomFactState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _PageContent(
                      state: state,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  AnotherFactButton(
                    active: state.canLoadNext,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  final RandomFactState state;

  const _PageContent({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final state = this.state;

    if (state is ErrorRandomFactState) {
      return LoadingErrorWidget(
        message: state.message,
      );
    }

    if (state is UninitializedRandomFactState) {
      return const NothingDisplayWidget(
        message: RandomFactPageStrings.loadFirstFact,
      );
    }

    if (state is LoadedRandomFactState) {
      return FactCard(
        fact: state.randomFactViewModel,
      );
    }

    return const Center(
      child: LoadingProgress(),
    );
  }
}
