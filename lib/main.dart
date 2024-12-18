import 'package:flutter/material.dart';
import 'package:untitled4/bloc/counter/counter_bloc.dart';
import 'package:untitled4/bloc/imagepicker/image_bloc.dart';
import 'package:untitled4/bloc/switch/switch_bloc.dart';
import 'package:untitled4/bloc/to_do/to_do_bloc.dart';
import 'package:untitled4/ui/counter/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/ui/imageP/image_picker_screen.dart';
import 'package:untitled4/ui/switch/switch_screen.dart';
import 'package:untitled4/ui/to_do/to_do_screen.dart';
import 'package:untitled4/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwitchBloc(),
        ),
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_)=>ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (_)=>ToDoBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
        home:const ToDoScreen(),
      ),
    );
  }
}

