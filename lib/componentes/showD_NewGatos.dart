import 'package:aplicacion_mecanico/clases/gasto.dart';
import 'package:aplicacion_mecanico/visualizacion/v_detallesservicio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VNuevoGasto extends StatefulWidget {
  @override
  _VNuevoGasto createState() => _VNuevoGasto();
}

class _VNuevoGasto extends State<VNuevoGasto> {
  @override
  Widget build(BuildContext context) {
    TextEditingController clientecontroller = TextEditingController();
    TextEditingController nombregasto = TextEditingController();
    TextEditingController preciogasto = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SimpleDialog(
      key: _formKey,
      backgroundColor: Colors.blue[200],
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 93,
            ),
            Text(
              'Gasto Nuevo',
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
            'Nombre del Gasto',
            style:
                GoogleFonts.hanuman(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: nombregasto,
            autofocus: true,
            autocorrect: true,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.description,
                color: Colors.black,
              ),
              hintText: 'Ingrese el nombre del gasto',
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Precio',
            style:
                GoogleFonts.hanuman(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            controller: preciogasto,
            autofocus: true,
            autocorrect: true,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.paid,
                color: Colors.black,
              ),
              hintText: 'Ingrese el precio',
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                borderSide: BorderSide(color: Colors.white, width: 3),
              ),
            ),
          ),
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
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
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
                  onPressed: () async {
                    Navigator.pop(
                        context,
                        Gasto(
                            nombre: nombregasto.text,
                            precio: preciogasto.text));
                  },
                  child: Text('Guardar'),
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
  }
}
