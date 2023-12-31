part of 'counter_cubit.dart';

class CounterStateCubit extends Equatable {
  final int counter;
  final int transactionCounter;

  const CounterStateCubit({this.counter = 0, this.transactionCounter = 0});

  copyWith({int? counter, int? transactionCounter}) {
    return CounterStateCubit(
      counter: counter ?? this.counter,
      transactionCounter: transactionCounter ?? this.transactionCounter,
    );
  }

  @override
  List<Object> get props => [counter, transactionCounter];
}
