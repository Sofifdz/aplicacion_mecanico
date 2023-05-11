import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../clases/claseVehiculo.dart';

class V_Servicios extends StatefulWidget {
  const V_Servicios({super.key});

  @override
  State<V_Servicios> createState() => _V_Servicios();
}

class _V_Servicios extends State<V_Servicios> {
  List<Vehiculo> vehiculos = [];
  var box = Hive.box('clientes');
  var clientesbox = Hive.box('clientes').values.toList();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text('Detalles'),
          titleTextStyle:
              GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
          backgroundColor: Colors.blue[900]),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Marca y modelo \n del carro',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nombre del cliente',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Column(children: [
            SizedBox(
              height: 100,
              width: 250,
              child: DefaultTabController(
                initialIndex: 1,
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('TabBar Widget'),
                    bottom: const TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: 'Servicio 1',
                        ),
                        Tab(
                          text: 'Servicio 1',
                        ),
                        Tab(
                          text: 'Servicio 3',
                        ),
                        Tab(
                          text: 'Servicio 4',
                        ),
                        Tab(
                          text: 'Servicio 5',
                        ),
                        Tab(
                          text: 'Servicio 6',
                        ),
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    children: <Widget>[
                      Center(
                        child: Text("Servicio 1"),
                      ),
                      Center(
                        child: Text("Servicio 2"),
                      ),
                      Center(
                        child: Text("Servicio 3"),
                      ),
                      Center(
                        child: Text("Servicio 4"),
                      ),
                      Center(
                        child: Text("Servicio 5"),
                      ),
                      Center(
                        child: Text("Servicio 6"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
          /*  SizedBox(
            height: 0,
          ),
          SizedBox(
            height: 30,
          ),*/
          // BotonAd2(context),
        ],
      ),
    );
  }

  Widget BotonAd(BuildContext context) => SizedBox(
        height: 45,
        child: Row(children: [
          const SizedBox(width: 100),
          SizedBox(
            width: 200,
            height: 180,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Color.fromRGBO(70, 98, 255, 1),
                minimumSize: const Size(150, 60),
              ),
              child: Text(
                'Servicios',
                style: GoogleFonts.hanuman(fontSize: 19),
              ),
            ),
          ),
        ]),
      );
  Widget BotonAd2(BuildContext context) => SizedBox(
      height: 45,
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 150,
          height: 80,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Color.fromARGB(255, 156, 170, 252),
              minimumSize: const Size(150, 60),
            ),
            child: Text(
              'Aceptar',
              style: GoogleFonts.hanuman(fontSize: 19),
            ),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        SizedBox(
          width: 150,
          height: 80,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Color.fromARGB(255, 156, 170, 252),
              minimumSize: const Size(150, 60),
            ),
            child: Text(
              'Cancelar',
              style: GoogleFonts.hanuman(fontSize: 19),
            ),
          ),
        ),
      ]));
}
