import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  final box = GetStorage();

  String get image => box.read('image') ?? "";

  bool write(String value) {
    if (value == null || value.isEmpty) return false;
    box.write('image', value);
    return true;
  }
}
