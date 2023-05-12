import 'package:aplicacion_mecanico/visualizacion/V_servicios.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../Agregar/VAgregarVehiculo.dart';

class NuevoServicioDialog extends StatefulWidget {
  @override
  _NuevoServicioDialogState createState() => _NuevoServicioDialogState();
}

class _NuevoServicioDialogState extends State<NuevoServicioDialog> {
  late String selectedCliente;
  bool _isClienteSelected = false;

  late String selectedVehiculo;
  bool isVehiculoSelected = false;

  void _updateIsClienteSelected(bool value) {
    setState(() {
      _isClienteSelected = value;
    });
  }

  void _updateIsVehiculoSelected(bool value) {
    setState(() {
      isVehiculoSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hbc = Hive.box('clientes');
    final Hbb = Hive.box('vehiculos');
    final boxclientes = Hive.box('clientes').values.toList();
    final boxvehiculos = Hive.box('vehiculos').values.toList();
    final _formKey = GlobalKey<FormState>();

    return SimpleDialog(
      backgroundColor: Colors.blue[200],
      children: [
        Row(
          children: [
            SizedBox(
              width: 55,
            ),
            Text(
              'Servicio Nuevo',
              style: GoogleFonts.montserrat(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Escoja el cliente',
            style: GoogleFonts.hanuman(fontSize: 15),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    onChanged: (value) {},
                    items: boxclientes
                        .map(
                          (clientes) => DropdownMenuItem(
                            value: clientes.nombre.toString(),
                            child: Text(
                              clientes.nombre.toString(),
                              style: GoogleFonts.hanuman(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(217, 217, 217, 1.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            'Escoja el Vehiculo',
            style: GoogleFonts.hanuman(fontSize: 15),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      setState(() {
                        selectedVehiculo = value! as String;
                        _updateIsVehiculoSelected(
                            true); // actualiza el valor de _isClienteSelected
                      });
                    },
                    items: Hbb.values
                        .map((dynamic vehiculo) => DropdownMenuItem(
                              value: vehiculo.placas.toString(),
                              child: Text(
                                vehiculo.placas.toString(),
                                style: GoogleFonts.hanuman(
                                  fontSize: 20,
                                ),
                              ),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(217, 217, 217, 1.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                  style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.hanuman(
                          fontSize: 15, color: Colors.black),
                      backgroundColor: Colors.lightBlue,
                      shape: StadiumBorder(),
                      elevation: 20,
                      shadowColor: Color.fromARGB(255, 55, 64, 65),
                      minimumSize: Size(100, 50)),
                ),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => V_Servicios()),
                    ).then((servicio) {
                      if (servicio != null) {
                        final boxvehiculos = Hive.box('servicios');
                        boxvehiculos.add(servicio);
                      }
                    });
                  },
                  child: Text('Continuar'),
                  style: ElevatedButton.styleFrom(
                      textStyle: GoogleFonts.hanuman(
                          fontSize: 15, color: Colors.black),
                      backgroundColor: Colors.lightBlue,
                      shape: StadiumBorder(),
                      elevation: 20,
                      shadowColor: Color.fromARGB(255, 55, 64, 65),
                      minimumSize: Size(100, 50)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
