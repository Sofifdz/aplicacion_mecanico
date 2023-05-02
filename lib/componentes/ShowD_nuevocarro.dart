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
                  'Nuevo Vehiculo',
                  style: GoogleFonts.montserrat(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4,
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
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var cliente = clientecontroller.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VAgregarVehiculo()),
                        );
                      },
                      child: Text('Agregar Vehiculo'),
                      style: ElevatedButton.styleFrom(
                          textStyle: GoogleFonts.hanuman(
                              fontSize: 12, color: Colors.black),
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
                          MaterialPageRoute(builder: (context) => AddCliente()),
                        );
                      },
                      child: Text('Nuevo Cliente'),
                      style: ElevatedButton.styleFrom(
                          textStyle: GoogleFonts.hanuman(
                              fontSize: 12, color: Colors.black),
                          backgroundColor: Colors.lightBlue,
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
