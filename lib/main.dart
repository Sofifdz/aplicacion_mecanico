import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'clases/cliente.dart';
import 'clases/vehiculo.dart';
import 'componentes/botonNavBar.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  // var box = await Hive.openBox('someBox');
  List<Map<String, dynamic>> clientes = [];

  Hive.registerAdapter(ClienteAdapter());
  var boxclientes = await Hive.openBox('clientes');
  print(boxclientes);
}

Future<void> Vehiculo() async {
  await Hive.initFlutter();
  // var box = await Hive.openBox('someBox');
  List<Map<String, dynamic>> vehiculos = [];

  Hive.registerAdapter(VehiculoAdapter());
  var boxvehiculos = await Hive.openBox('vehiculos');
  print(boxvehiculos);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BotonNav(),
    );
  }
}
