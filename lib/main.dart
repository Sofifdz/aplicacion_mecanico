import 'package:aplicacion_mecanico/calendario2.0/event_provider.dart';
import 'package:aplicacion_mecanico/calendario2.0/ver.dart';
import 'package:aplicacion_mecanico/clases/claseVehiculo.dart';
import 'package:aplicacion_mecanico/clases/cotizaciones.dart';
import 'package:aplicacion_mecanico/clases/gasto.dart';
import 'package:aplicacion_mecanico/clases/servicios.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'clases/cliente.dart';

import 'componentes/botonNavBar.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox('clientes');
  Hive.registerAdapter(ClienteAdapter());
  List<Map<String, dynamic>> clientes = [];
  print(clientes);

  await Hive.openBox('vehiculos');
  Hive.registerAdapter(VehiculoAdapter());
  List<Map<String, dynamic>> vehiculos = [];

  await Hive.openBox('servicios');
  Hive.registerAdapter(ServiciosAdapter());
  List<Map<String, dynamic>> servicios = [];

  await Hive.openBox('gastos');
  Hive.registerAdapter(GastoAdapter());
  List<Map<String, dynamic>> gastos = [];

  await Hive.openBox('cotizaciones');
  Hive.registerAdapter(CotizacionAdapter());
  List<Map<String, dynamic>> cotizaciones = [];

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
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
            home: const BotonNav()),
      );
}
