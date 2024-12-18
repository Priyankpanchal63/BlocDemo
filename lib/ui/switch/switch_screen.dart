import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/switch/switch_bloc.dart';
import 'package:untitled4/bloc/switch/switch_event.dart';
import 'package:untitled4/bloc/switch/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                  builder: (context, state) {
                    return Switch(value: state.isSwitch, onChanged: (newValue) {
                      context.read<SwitchBloc>().add(
                          EnableOrDisableNotification());
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return  Container(
                  height: 200,
                  color: Colors.amber.withOpacity(state.slider/10),
                );
              },
            ),

            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous,current)=>previous.slider!=current.slider,
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  min: 0.0, // Set the minimum value
                  max: 10.0, // Set the maximum value to encompass the value 4.0
                  onChanged: (value) {
                  context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
