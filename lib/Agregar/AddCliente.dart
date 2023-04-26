import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '../clases/cliente.dart';

class AddCliente extends StatefulWidget {
  AddCliente({super.key});

  @override
  State<AddCliente> createState() => _AddClienteState();
}

class _AddClienteState extends State<AddCliente> {
  final TextEditingController nombrecontroller = TextEditingController();

  final TextEditingController telefonocontroller = TextEditingController();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController ciudadcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var boxclientes = Hive.openBox('clientes');
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text('Agregar Cliente'),
          backgroundColor: Colors.blue[900],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              body(context),
              SizedBox(
                height: 30,
              ),
              BotonAd(context),
            ],
          ),
        ));
  }

  Widget body(BuildContext context) {
    return Column(children: [
      Form(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: <Widget>[
            SizedBox(
              height: 20,
            ),
            NombreC(context),
            TxtNombre(
              context,
            ),
            SizedBox(
              height: 10,
            ),
            TelC(context),
            SizedBox(
              height: 10,
            ),
            CiudadC(context),
            TxtDom(context),
            SizedBox(
              height: 10,
            ),
            Mailc(context),
            TxtMail(context)
          ])),
    ]);
  }

  Widget NombreC(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              Icons.person,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Nombre',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                //fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
  Widget TxtNombre(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Escribe el nombre';
                }
                return null;
              },
              controller: nombrecontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 216, 216, 216),
              ),
            )),
          ],
        ),
      );

  Widget TelC(BuildContext context) => Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.phone,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Telefono',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                //fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
                child: TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Escribe el Telefono';
                }
                return null;
              },
              controller: telefonocontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 216, 216, 216),
              ),
            )),
          ],
        ),
      );

  Widget Mailc(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              Icons.mail,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Correo Electronico',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                //fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
  Widget TxtMail(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Escribe el Email';
                }
                return null;
              },
              controller: emailcontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 216, 216, 216),
              ),
            )),
          ],
        ),
      );
  Widget CiudadC(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(
              Icons.location_city,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Domicilio',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                //fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
  Widget TxtDom(BuildContext context) => Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Escribe la Ciudad';
                }
                return null;
              },
              controller: ciudadcontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 216, 216, 216),
              ),
            )),
          ],
        ),
      );

  Widget BotonAd(BuildContext context) => Container(
        height: 45,
        child: Row(children: [
          SizedBox(
            width: 8,
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
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.blue[900],
              ),
              child: Text('Cancelar'),
            ),
          ),
          SizedBox(
            width: 40,
          ),
          SizedBox(
            width: 180,
            height: 80,
            child: ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                Navigator.pop(
                    context,
                    Cliente(
                        nombre: nombrecontroller.text,
                        telefono: telefonocontroller.text,
                        email: emailcontroller.text,
                        ciudad: ciudadcontroller.text));
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            'Cliente Agregado correctamente',
                            style: GoogleFonts.aBeeZee(fontSize: 14),
                          ),
                          backgroundColor: Colors.blue[250],
                        ));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue[900],
              ),
              child: Text('Agregar Cliente'),
            ),
          ),
        ]),
      );
}
