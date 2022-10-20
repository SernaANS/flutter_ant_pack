import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prueba_ant_pack/Services/local_file.dart';

import 'package:prueba_ant_pack/Services/services.dart';
import 'package:prueba_ant_pack/models/usuario.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:prueba_ant_pack/pages/home/image_capture.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Internet
  bool isconected = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  //ScrollInfinite
  //final PagingController<int, CharacterSummary> _pagingController =
  //    PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();

    //*For internet connection
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

//ScrollInfinite
    //_pagingController.addPageRequestListener((pageKey) {
    //  _fetchPage(pageKey);
    //});
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //DataState controller = Get.put(DataState());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Artpack"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: isconected ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          onPressed: () {
            Get.to(ImageCapture());
          },
          icon: Icon(Icons.image),
          label: Text('Imagen'),
        ),
        body: Container(
          child: isconected
              ? FutureBuilder<List<Usuario>>(
                  future: Services().getUsers(),
                  builder: ((context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasError)
                      return Text("error");
                    else if (snapshot.hasData)
                      return Text(snapshot.data.toString());
                    else
                      return Text(snapshot.toString());
                  }),
                )
              : FutureBuilder<List<Usuario>>(
                  future: LocalFile().getUsers("jsons/users.json"),
                  builder: ((context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasError)
                      return Text("error");
                    else if (snapshot.hasData)
                      return grid(context, snapshot.data);
                    else
                      return Text(snapshot.toString());
                  }),
                ),
        ));
  }

  GridView grid(BuildContext context, List<Usuario> list) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(list.length, (index) {
        return Center(
          child: Text("${list[index].name}"),
        );
      }),
    );
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status');
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      if (result.index == 4) {
        isconected = false;
      } else {
        isconected = true;
      }
    });
  }
}
