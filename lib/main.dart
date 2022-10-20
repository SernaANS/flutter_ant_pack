import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:prueba_ant_pack/initial_bindings.dart';
import 'package:prueba_ant_pack/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
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
