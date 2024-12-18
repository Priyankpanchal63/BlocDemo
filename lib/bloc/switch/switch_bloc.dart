import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/bloc/switch/switch_event.dart';
import 'package:untitled4/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(SwitchState()){
    on<EnableOrDisableNotification>(_enableordisablenotification);
    on<SliderEvent>(_slider);
  }
  void _enableordisablenotification(EnableOrDisableNotification events,Emitter<SwitchState>emit){
  emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _slider(SliderEvent events,Emitter<SwitchState>emit){
    emit(state.copyWith(slider: events.slider));
  }

}