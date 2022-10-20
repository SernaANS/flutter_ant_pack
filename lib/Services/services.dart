import 'dart:convert';

import 'package:prueba_ant_pack/Services/const.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_ant_pack/models/usuario.dart';

class Services {
  Future<List<Usuario>> getUsers() async {
    try {
      final url = Uri.parse(Const().users);
      print(url);
      final response = await http.get(
        url,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> jsonresponse = json.decode(response.body);
        List<Usuario> users = [];
        jsonresponse.forEach((element) {
          users.add(Usuario.fromMap(element));
        });

        return users;
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
