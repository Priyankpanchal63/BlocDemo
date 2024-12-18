import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled4/bloc/imagepicker/image_event.dart';
import 'package:untitled4/bloc/imagepicker/image_state.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(camersCpture);
    on<GalleryCapture>(galleryCapture);
  }

  void camersCpture(event, emit)async {
    XFile? file=await imagePickerUtils.cameraCpture();
    emit(state.copyWith(file: file));
  }
  void galleryCapture(event,emit)async{
    XFile? file=await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
