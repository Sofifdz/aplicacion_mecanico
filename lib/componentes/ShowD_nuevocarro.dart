import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../Agregar/AddCliente.dart';
import '../Agregar/AddVehiculo.dart';

class NewCarroDeClienteDialog {
  static void show(BuildContext context) {
    var boxclientes = Hive.box('clientes').values.toList();
    TextEditingController clientecontroller = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          key: _formKey,
          backgroundColor: Colors.blue[200],
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
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel))
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
                          clientecontroller.text = value.toString();
                        },
                        validator: (value) {
                          validator:
                          (value) => value == null
                              ? 'Please fill in your gender'
                              : null;
                        },
                        items: boxclientes
                            .map(
                              (clientes) => DropdownMenuItem(
                                value: clientes.nombre.toString(),
                                child: Text(clientes.nombre.toString()),
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
            Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var cliente = clientecontroller.text;
                        Navigator.pop(context, AddCliente());
                      },
                      child: Text('Agregar Vehiculo'),
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
      },
    ).then((value) {});
  }
}
