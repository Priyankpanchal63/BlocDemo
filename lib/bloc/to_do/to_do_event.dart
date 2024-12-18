abstract class ToDoEvent{
  const ToDoEvent();
}

class AddToDoEvent extends ToDoEvent{
  final String task;
  const AddToDoEvent({required this.task});
}

class RemoveToDoEvent extends ToDoEvent{
  final Object task;
  const RemoveToDoEvent({required this.task});
}