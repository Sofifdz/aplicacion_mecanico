import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class NuevoServicioDialog {
  static void show(BuildContext context) {
    var box = Hive.box('clientes');
    var boxclientes = Hive.box('clientes').values.toList();
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.blue[200],
          children: <Widget>[
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
                        items: [
                          DropdownMenuItem(
                            child: Text('op1'),
                            value: 'opcion1',
                          ),
                          DropdownMenuItem(
                            child: Text('op2'),
                            value: 'opcion2',
                          ),
                          DropdownMenuItem(
                            child: Text('op3'),
                            value: 'opcion3',
                          ),
                        ],
                        onChanged: (Object? value) {},
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
                      onPressed: () {},
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
      },
    ).then((value) {});
  }
}
