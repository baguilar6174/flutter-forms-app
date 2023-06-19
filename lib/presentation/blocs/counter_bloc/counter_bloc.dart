import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStateBloc> {
  CounterBloc() : super(const CounterStateBloc()) {
    on<CounterIncrease>(_onCounterIncrease);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncrease(
    CounterIncrease event,
    Emitter<CounterStateBloc> emit,
  ) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCounter: state.transactionCounter + 1,
      ),
    );
  }

  void _onCounterReset(
    CounterReset event,
    Emitter<CounterStateBloc> emit,
  ) {
    emit(
      state.copyWith(
        counter: 0,
      ),
    );
  }
}
