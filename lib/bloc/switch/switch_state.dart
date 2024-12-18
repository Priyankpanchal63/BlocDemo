class SwitchState {
  bool isSwitch;
  double slider;
  SwitchState({this.isSwitch = false,this.slider=1.0});

  SwitchState copyWith({bool? isSwitch,double? slider}) {
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider
    );
  }
}
