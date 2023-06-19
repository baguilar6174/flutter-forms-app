import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_forms_app/presentation/blocs/blocs.dart';

class BlocCounterPage extends StatelessWidget {
  const BlocCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncrease(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('Bloc counter: ${counterBloc.state.transactionCounter}');
        }),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) {
          return Text('Counter: ${counterBloc.state.counter}');
        }),
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
            onPressed: () => increaseBy(context, 1),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
