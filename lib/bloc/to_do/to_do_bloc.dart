import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled4/bloc/to_do/to_do_event.dart';
import 'package:untitled4/bloc/to_do/to_do_state.dart';


class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String>todoList=[];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addTodoEvent);
    on<RemoveToDoEvent>(_removeTodoEvent);
  }
  void _addTodoEvent(event,emit){
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodoEvent(event,emit){
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
