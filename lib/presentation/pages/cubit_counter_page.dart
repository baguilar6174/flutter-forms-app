import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forms_app/presentation/presentation.dart';

class CubitCounterPage extends StatelessWidget {
  const CubitCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // ? Method 1
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        // ? Method 1
        // title: Text('Cubit counter: ${counterState.transactionCounter}'),
        // ? Method 2
        title: context.select((CounterCubit value) {
          return Text('Cubit counter: ${value.state.transactionCounter}');
        }),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterStateCubit>(
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseBy(context),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
