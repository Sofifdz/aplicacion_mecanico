import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cotizaconesnueva extends StatefulWidget {
  @override
  _cotizaconesnueva createState() => _cotizaconesnueva();
}

class _cotizaconesnueva extends State<cotizaconesnueva> {
  @override
  Widget build(BuildContext context) {
    TextEditingController clientecontroller = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SimpleDialog(
      key: _formKey,
      backgroundColor: Colors.blue[200],
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              'Cotizacion Nueva',
              style: GoogleFonts.montserrat(
                  fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 0,
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
            'Nombre De la Cotizacion',
            style:
                GoogleFonts.hanuman(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            autofocus: true,
            autocorrect: true,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.description,
                color: Colors.black,
              ),
              hintText: 'Nombre de la cotizacion',
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
            'Cantidad',
            style:
                GoogleFonts.hanuman(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            autofocus: true,
            autocorrect: true,
            keyboardType: TextInputType.number,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.pin,
                color: Colors.black,
              ),
              hintText: 'Cantidades',
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
            autofocus: true,
            autocorrect: true,
            keyboardType: TextInputType.number,
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
        Center(
          child: Text(
            'Proveedor',
            style:
                GoogleFonts.hanuman(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextField(
            autofocus: true,
            autocorrect: true,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Ingrese el Proveedor',
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
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
