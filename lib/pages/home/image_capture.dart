import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_ant_pack/pages/home/controller.dart';

class ImageCapture extends StatefulWidget {
  const ImageCapture({super.key});

  @override
  State<ImageCapture> createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (controller) {
      //String image = controller.image;
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          onPressed: () async {
            final ImagePicker _picker = ImagePicker();

            XFile? _pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);

            if (_pickedFile != null) controller.write(_pickedFile.path);
            setState(() {});
          },
          icon: Icon(Icons.image),
          label: Text('Select Imagen'),
        ),
        body: Column(
          children: [
            controller.image.isNotEmpty
                ? Image.file(File(controller.image))
                : Image.asset("assets/not_found.jpg")
          ],
        ),
      );
    });
  }
}
