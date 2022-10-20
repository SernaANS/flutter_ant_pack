import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_ant_pack/pages/home/controller.dart';

class ImageCapture extends StatelessWidget {
  const ImageCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(builder: (controller) {
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
                await _picker.pickImage(source: ImageSource.camera);

            if (_pickedFile != null)
              controller.imagePath.value = _pickedFile.path;
          },
          icon: Icon(Icons.image),
          label: Text('Imagen'),
        ),
        body: Column(
          children: [
            controller.imagePath.value == ""
                ? Image.asset("assets/not_found.jpg")
                : Image.file(File(controller.imagePath.value))
          ],
        ),
      );
    });
  }
}
