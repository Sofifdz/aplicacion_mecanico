import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Ver_DatosCliente extends StatefulWidget {
  const Ver_DatosCliente({super.key});
  @override
  State<StatefulWidget> createState() {
    return Ver_DatosClienteState();
  }
}

class Ver_DatosClienteState extends State<Ver_DatosCliente> {
  var box = Hive.box('clientes');
  var clientesbox = Hive.box('clientes').values.toList();
  List<dynamic> clientes = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Detalles'),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
          itemCount: clientesbox.length,
          itemBuilder: (context, index) {
            final cliente = clientesbox[index];
            var v = box.getAt(index);

            return Card(
                color: Color.fromARGB(255, 188, 187, 187),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    titulo(context),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      SizedBox(
                        height: 90,
                      ),
                      Expanded(
                        child: Center(
                            child: Text(
                          clientesbox[index].nombre,
                          style: GoogleFonts.hanuman(
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        'Numero telefonico',
                        style: GoogleFonts.hanuman(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        clientesbox[index].telefono,
                        style: GoogleFonts.hanuman(
                          fontSize: 20,
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        'Email',
                        style: GoogleFonts.hanuman(
                          fontSize: 20,
                        ),
                      )),
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        clientesbox[index].email,
                        style: GoogleFonts.hanuman(
                          fontSize: 12,
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                          child: Text(
                        'Ciudad',
                        style: GoogleFonts.hanuman(
                          fontSize: 20,
                        ),
                      )),
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        clientesbox[index].ciudad,
                        style: GoogleFonts.hanuman(
                          fontSize: 20,
                        ),
                      ),
                    ]),
                  ],
                ));
          }),
    );
  }

  Widget titulo(context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
            child: Center(
          child: Text(
            'Editar Datos Cliente',
            style: GoogleFonts.hanuman(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        )));
  }
}
