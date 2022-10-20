import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:prueba_ant_pack/initial_bindings.dart';
import 'package:prueba_ant_pack/pages/home/home_page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      home: HomePage(),
    );
  }
}
