part of 'counter_bloc.dart';

class CounterStateBloc extends Equatable {
  final int counter;
  final int transactionCounter;

  const CounterStateBloc({this.counter = 0, this.transactionCounter = 0});

  copyWith({int? counter, int? transactionCounter}) {
    return CounterStateBloc(
      counter: counter ?? this.counter,
      transactionCounter: transactionCounter ?? this.transactionCounter,
    );
  }

  @override
  List<Object> get props => [counter, transactionCounter];
}
