

class ToDoState{
  final List<String>todoList;

  const ToDoState({this.todoList=const[]});
  ToDoState copyWith({List<String>?todoList}){
    return ToDoState(
      todoList: todoList??this.todoList
    );
  }
}