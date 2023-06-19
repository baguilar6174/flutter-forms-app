part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncrease extends CounterEvent {
  final int value;
  const CounterIncrease(this.value);
}

class CounterReset extends CounterEvent {}
