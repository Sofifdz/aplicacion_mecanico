import 'package:aplicacion_mecanico/Agregar/VAgregarVehiculo.dart';
import 'package:aplicacion_mecanico/Agregar/agregar_cliente.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../clases/cliente.dart';

class NewCarroDeClienteDialog extends StatefulWidget {
  @override
  _NewCarroDeClienteDialogState createState() =>
      _NewCarroDeClienteDialogState();
}

class _NewCarroDeClienteDialogState extends State<NewCarroDeClienteDialog> {
  late String selectedCliente;
  bool _isClienteSelected = false;

  // función para actualizar el estado del widget y guardar el valor de _isClienteSelected
  void _updateIsClienteSelected(bool value) {
    setState(() {
      _isClienteSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final boxclientes = Hive.box('clientes');
    final _formKey = GlobalKey<FormState>();

    return SimpleDialog(
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 45,
            ),
            Text(
              'Seleccione el cliente',
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
            SizedBox(
              width: 5,
            ),
          ],
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
                        selectedCliente = value!;
                        _updateIsClienteSelected(
                            true); // actualiza el valor de _isClienteSelected
                      });
                    },
                    validator: (value) {
                      return value == null
                          ? 'Por favor seleccione un cliente'
                          : null;
                    },
                    items: boxclientes.values
                        .map((dynamic cliente) => DropdownMenuItem(
                              value: cliente.nombre.toString(),
                              child: Text(cliente.nombre.toString()),
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
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isClienteSelected
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VAgregarVehiculo()),
                          ).then((vehiculo) {
                            if (vehiculo != null) {
                              final boxvehiculos = Hive.box('vehiculos');
                              boxvehiculos.add(vehiculo);
                            }
                            /*  Cliente porNombre = boxclientes.values.firstWhere(
                                (element) => element.nombre == selectedCliente,
                                orElse: () => Cliente(
                                      nombre: '',
                                      telefono: '',
                                      alias: '',
                                      ciudad: '',
                                      email: '',
                                      telefonoadicional: '',
                                      vehiculos: [],
                                    ));
                            print('0');
                            print('1');

                            porNombre.vehiculos.add(vehiculo);
                            print('2');

                            boxclientes.put(
                                boxclientes.values.toList().indexOf(porNombre),
                                porNombre);
                            print('3');*/
                          });
                          print('4');
                        }
                      : null,
                  child: Text('Agregar Vehiculo'),
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                      ),
                      backgroundColor: _isClienteSelected
                          ? Colors.blue
                          : Colors
                              .grey, // el color de fondo del botón cambia dependiendo del estado de la variable
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
                      MaterialPageRoute(builder: (context) => AddCliente()),
                    );
                  },
                  child: Text('Nuevo Cliente'),
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                      ),
                      backgroundColor: Colors.blue,
                      shape: StadiumBorder(),
                      elevation: 20,
                      shadowColor: Color.fromARGB(255, 55, 64, 65),
                      minimumSize: Size(100, 50)),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
