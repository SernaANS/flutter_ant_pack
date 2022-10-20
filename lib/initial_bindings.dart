import 'package:get/get.dart';
import 'package:prueba_ant_pack/pages/home/controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller(), fenix: true);
    //Get.lazyPut(() => CarteraController(), fenix: true);
  }
}
