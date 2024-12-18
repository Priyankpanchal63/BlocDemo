import 'package:bloc/bloc.dart';
import 'package:untitled4/bloc/counter/counter_event.dart';
import 'package:untitled4/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_Decrement);
    }
    void _increment(event,emit){
      emit(state.copyWith(counter: state.counter+1));
    }
  void _Decrement(event,emit){
    emit(state.copyWith(counter: state.counter-1));
  }
}
