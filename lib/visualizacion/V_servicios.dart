import 'package:aplicacion_mecanico/paquetes/p3.ServicioDeSuspencion.dart';
import 'package:aplicacion_mecanico/paquetes/p4.ServicioDIreccionHidraulica.dart';
import 'package:aplicacion_mecanico/paquetes/p5.CondicionesdelMotor.dart';
import 'package:aplicacion_mecanico/paquetes/p6.CondicionesEnfriamiento.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../clases/claseVehiculo.dart';
import '../paquetes/p1.AfinacionMayorCompleta.dart';
import '../paquetes/p2.ServicioDeFrenos.dart';

class V_Servicios extends StatefulWidget {
  const V_Servicios({super.key});

  @override
  State<V_Servicios> createState() => _V_Servicios();
}

class _V_Servicios extends State<V_Servicios> {
  List<Vehiculo> vehiculos = [];
  var boxc = Hive.box('clientes');
  var box = Hive.box('vehiculos');
  var clientesbox = Hive.box('vehiculos').values.toList();
  var clientesboxx = Hive.box('clientes').values.toList();
  var servbox = Hive.box('servicios');

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
            titleTextStyle: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold),
            backgroundColor: Colors.blue[900]),
        body: ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        clientesbox[index].marca,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Marca del vehicul0',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        clientesbox[index].modelo,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Modelo del vehiculo',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        clientesboxx[index].nombre,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nombre del cliente',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 900,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue.shade900,
                              width: 2,
                            ),
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Padding(
                                  padding: EdgeInsets.all(15),
                                  child: SizedBox(
                                    height: 850,
                                    width: 800,
                                    child: DefaultTabController(
                                      initialIndex: 1,
                                      length: 6,
                                      child: Scaffold(
                                        appBar: AppBar(
                                          foregroundColor: Colors.blue[900],
                                          backgroundColor: Colors.blue[900],
                                          toolbarHeight: 20,
                                          bottom: const TabBar(
                                            tabs: <Widget>[
                                              Tab(
                                                text: '1',
                                              ),
                                              Tab(
                                                text: '2',
                                              ),
                                              Tab(
                                                text: '3',
                                              ),
                                              Tab(
                                                text: '4',
                                              ),
                                              Tab(
                                                text: '5',
                                              ),
                                              Tab(
                                                text: '6',
                                              ),
                                            ],
                                          ),
                                        ),
                                        body: TabBarView(
                                          children: <Widget>[
                                            Paquete1(),
                                            Paquete3(),
                                            ServicioSuspencion(),
                                            ServicioDireccionHidrahulica(),
                                            CondicionesMotor(),
                                            Paquete6(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BotonAd2(context),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
            }));
  }

  Widget BotonAd2(BuildContext context) => SizedBox(
      height: 45,
      child: Row(children: [
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
              primary: Color.fromARGB(255, 195, 214, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: Text(
              'Aceptar',
              style: GoogleFonts.hanuman(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
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
              primary: Color.fromARGB(255, 195, 214, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: Text(
              'Cancelar',
              style: GoogleFonts.hanuman(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
      ]));
}
