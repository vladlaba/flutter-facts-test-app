import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facts_test_app/common/widgets/loading_error_widget.dart';
import 'package:flutter_facts_test_app/common/widgets/loading_progress.dart';
import 'package:flutter_facts_test_app/common/widgets/nothing_display_widget.dart';
import 'package:flutter_facts_test_app/facts_history/cubit/facts_history_cubit.dart';
import 'package:flutter_facts_test_app/facts_history/cubit/facts_history_states.dart';
import 'package:flutter_facts_test_app/facts_history/strings/facts_history_page_strings.dart';
import 'package:flutter_facts_test_app/facts_history/widgets/fact_history_list_view.dart';

class FactsHistoryPage extends StatefulWidget {
  const FactsHistoryPage({super.key});

  @override
  State<FactsHistoryPage> createState() => _FactsHistoryPageState();
}

class _FactsHistoryPageState extends State<FactsHistoryPage> {
  @override
  void initState() {
    context.read<FactsHistoryCubit>().loadHistory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(FactsHistoryPageStrings.pageTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<FactsHistoryCubit, FactsHistoryState>(
          builder: (context, state) {
            if (state is EmptyFactsHistoryState) {
              return NothingDisplayWidget(
                message: state.message,
              );
            }

            if (state is ErrorFactsHistoryState) {
              return LoadingErrorWidget(
                message: state.message,
              );
            }

            if (state is LoadedFactsHistoryState) {
              return FactHistoryListView(
                facts: state.facts,
              );
            }

            return const Center(
              child: LoadingProgress(),
            );
          },
        ),
      ),
    );
  }
}
