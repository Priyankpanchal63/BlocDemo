import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/to_do/to_do_bloc.dart';
import 'package:untitled4/bloc/to_do/to_do_event.dart';

import '../../bloc/to_do/to_do_state.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODODemo'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if(state.todoList.isEmpty){
            return const Center(child: Text("no to list"),);
          }
          else if(state.todoList.isNotEmpty){
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<ToDoBloc>().add(RemoveToDoEvent(task:state.todoList[index] ));
                      },
                    ),
                  );
                });
          }
          else{
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i=0;i<10;i++){
            context.read<ToDoBloc>().add(AddToDoEvent(task: 'Task:'+i.toString()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
