import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:prueba_ant_pack/models/usuario.dart';

class LocalFile {
  Future<List<Usuario>> getUsers(String filePath) async {
    final String response = await rootBundle.loadString(filePath);

    List<dynamic> jsonresponse = json.decode(response);
    List<Usuario> users = [];
    jsonresponse.forEach((element) {
      users.add(Usuario.fromMap(element));
    });
    return users;
  }
}
