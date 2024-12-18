import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/imagepicker/image_bloc.dart';
import 'package:untitled4/bloc/imagepicker/image_event.dart';
import 'package:untitled4/bloc/imagepicker/image_state.dart';
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickeerState();
}

class _ImagePickeerState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Image Picker Bloc'),
        ),
        body: Center(
          child: BlocBuilder<ImagePickerBloc,ImagePickerState>(
            builder: (context,state){
              if (state.file==null) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:(){
                          context.read<ImagePickerBloc>().add(CameraCapture());
                        },
                        child: CircleAvatar(
                        child: Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap:(){
                          context.read<ImagePickerBloc>().add(GalleryCapture());
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.image),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Image.file(File(state.file!.path.toString()));
              }},

          ),
        ),
      ),
    );
  }
}
