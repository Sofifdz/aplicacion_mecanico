import 'package:aplicacion_mecanico/clases/claseVehiculo.dart';
import 'package:aplicacion_mecanico/componentes/barradbusqueda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../componentes/botonspeed.dart';

class Ver_clientes extends StatefulWidget {
  const Ver_clientes({super.key});

  @override
  State<StatefulWidget> createState() {
    return Ver_clientesState();
  }
}

class Ver_clientesState extends State<Ver_clientes> {
  List<dynamic> clientes = [];
  List<TextEditingController> controllers = [];
  List<TextEditingController> controllersalias = [];
  List<TextEditingController> controllertelefono = [];
  List<TextEditingController> controllertelefonoad = [];
  List<TextEditingController> controllercorreo = [];
  List<TextEditingController> controllerdomicilio = [];

  List<dynamic> vehiculos = [];
  List<TextEditingController> controllersmarca = [];
  List<TextEditingController> controllermodelo = [];
  List<TextEditingController> controlleranio = [];
  List<TextEditingController> controllermotor = [];
  List<TextEditingController> controllercolor = [];
  List<TextEditingController> controllervn = [];
  List<TextEditingController> controllerkms = [];
  List<TextEditingController> controllerplacas = [];
  List<TextEditingController> controllerfecha = [];

  void actualizarvehiculo(int index) {
    var vehiculo = vehiculosbox[index];
    vehiculo.marca = controllersmarca[index].text;
    vehiculo.modelo = controllermodelo[index].text;
    vehiculo.anio = controlleranio[index].text;
    vehiculo.motor = controllermotor[index].text;
    vehiculo.color = controllercolor[index].text;
    vehiculo.vn = controllervn[index].text;
    vehiculo.kms = controllerkms[index].text;
    vehiculo.placas = controllerplacas[index].text;
    vehiculo.fecha = controllerfecha[index].text;
    box1.putAt(index, vehiculo);
  }

  void actualizarInformacion(int index) {
    var cliente = clientesbox[index];
    cliente.nombre = controllers[index].text;
    cliente.alias = controllersalias[index].text;
    cliente.telefono = controllertelefono[index].text;
    cliente.telefonoadicional = controllertelefonoad[index].text;
    cliente.email = controllercorreo[index].text;
    cliente.ciudad = controllerdomicilio[index].text;
    box.putAt(index, cliente);
  }

  var box = Hive.box('clientes');
  var clientesbox = Hive.box('clientes').values.toList();

  var box1 = Hive.box('vehiculos');
  var vehiculosbox = Hive.box('vehiculos').values.toList();

  @override
  Widget build(BuildContext context) {
    vehiculosbox.forEach((vehiculo) {
      controllersmarca.add(TextEditingController(text: vehiculo.marca));
      controllermodelo.add(TextEditingController(text: vehiculo.modelo));
      controlleranio.add(TextEditingController(text: vehiculo.anio));
      controllermotor.add(TextEditingController(text: vehiculo.motor));
      controllercolor.add(TextEditingController(text: vehiculo.color));
      controllervn.add(TextEditingController(text: vehiculo.vn));
      controllerkms.add(TextEditingController(text: vehiculo.kms));
      controllerplacas.add(TextEditingController(text: vehiculo.placas));
      controllerfecha.add(TextEditingController(text: vehiculo.fecha));
    });

    clientesbox.forEach((cliente) {
      controllers.add(TextEditingController(text: cliente.nombre));
      controllersalias.add(TextEditingController(text: cliente.alias));
      controllertelefono.add(TextEditingController(text: cliente.telefono));
      controllertelefonoad
          .add(TextEditingController(text: cliente.telefonoadicional));
      controllercorreo.add(TextEditingController(text: cliente.email));
      controllerdomicilio.add(TextEditingController(text: cliente.ciudad));
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Clientes'),
        titleTextStyle:
            GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BarradeBusqueda(clientes));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final cliente = clientesbox[index];

            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(20),
                elevation: 3,
                child: Row(children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      clientesbox[index].nombre,
                      style: GoogleFonts.hanuman(
                        fontSize: 25,
                      ),
                    )),
                  ),
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Mas detalles"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Eliminar Cliente"),
                      ),
                    ],
                    initialValue: 0,
                    //  onCanceled: () {
                    // print("You have canceled the menu.");
                    //  },
                    onSelected: (value) {
                      if (value == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                                appBar: AppBar(
                                  backgroundColor: Colors.blue[900],
                                  title: const Text(
                                    'Detalles del cliente,',
                                  ),
                                ),
                                body: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Carros del cliente',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 280,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 86, 140, 255),
                                                      width: 2,
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 86, 140, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: ListView.builder(
                                                      itemCount: box1.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Card(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            margin:
                                                                EdgeInsets.all(
                                                                    20),
                                                            elevation: 3,
                                                            child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  SizedBox(
                                                                    height: 90,
                                                                  ),
                                                                  Expanded(
                                                                    child: Center(
                                                                        child: Text(
                                                                      vehiculosbox[
                                                                              index]
                                                                          .marca,
                                                                      style: GoogleFonts
                                                                          .hanuman(
                                                                        fontSize:
                                                                            25,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                  PopupMenuButton(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    itemBuilder:
                                                                        (context) =>
                                                                            [
                                                                      PopupMenuItem(
                                                                        value:
                                                                            1,
                                                                        child: Text(
                                                                            "Mas detalles"),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        value:
                                                                            2,
                                                                        child: Text(
                                                                            "Eliminar Cliente"),
                                                                      ),
                                                                    ],
                                                                    initialValue:
                                                                        0,
                                                                    //  onCanceled: () {
                                                                    // print("You have canceled the menu.");
                                                                    //  },
                                                                    onSelected:
                                                                        (value) {
                                                                      if (value ==
                                                                          1) {
                                                                        Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Scaffold(
                                                                              appBar: AppBar(
                                                                                  toolbarHeight: 70,
                                                                                  centerTitle: true,
                                                                                  title: const Text('Vehiculo del cliente'),
                                                                                  titleTextStyle: GoogleFonts.montserrat(
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  backgroundColor: Colors.blue[900]),
                                                                              body: ListView(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    height: 30,
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      Expanded(
                                                                                          child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          border: Border.all(
                                                                                            color: Color.fromARGB(0, 125, 177, 255),
                                                                                            width: 2,
                                                                                          ),
                                                                                          color: Color.fromARGB(167, 125, 177, 255),
                                                                                          borderRadius: BorderRadius.circular(30),
                                                                                        ),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              height: 25,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Marca: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllersmarca[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].marca,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Modelo: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllermodelo[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].modelo,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Año: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controlleranio[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].anio,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Motor: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllermotor[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].motor,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Color: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllercolor[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].color,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Vin: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllervn[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].vn,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Kms: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllerkms[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].kms,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),
                                                                                            Row(
                                                                                              children: [
                                                                                                SizedBox(width: 15),
                                                                                                Text(
                                                                                                  'Placas: ',
                                                                                                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Center(
                                                                                                    child: TextField(
                                                                                                      controller: controllerplacas[index],
                                                                                                      decoration: InputDecoration(
                                                                                                        hintText: vehiculosbox[index].placas,
                                                                                                        filled: true,
                                                                                                        fillColor: Color.fromARGB(255, 255, 255, 255),
                                                                                                      ),
                                                                                                      style: GoogleFonts.roboto(fontSize: 22),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: 15,
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(height: 20),
                                                                                            ElevatedButton(
                                                                                              onPressed: () {
                                                                                                // Actualiza el nombre del cliente en la base de datos
                                                                                                actualizarvehiculo(index);
                                                                                                // Actualiza los demás campos del cliente en la base de datos
                                                                                                var vehiculo = vehiculosbox[index];
                                                                                                vehiculo.marca = controllersmarca[index].text;
                                                                                                vehiculo.modelo = controllermodelo[index].text;
                                                                                                vehiculo.anio = controlleranio[index].text;
                                                                                                vehiculo.motor = controllermotor[index].text;
                                                                                                vehiculo.color = controllercolor[index].text;
                                                                                                vehiculo.vn = controllervn[index].text;
                                                                                                vehiculo.kms = controllerkms[index].text;
                                                                                                vehiculo.placas = controllerplacas[index].text;
                                                                                                vehiculo.fecha = controllerfecha[index].text;
                                                                                                box1.putAt(index, vehiculo);

                                                                                                // Actualiza la lista de clientes para reflejar los cambios
                                                                                                setState(() {
                                                                                                  vehiculos = box1.values.toList();
                                                                                                });

                                                                                                // Muestra un mensaje de confirmación
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(content: Text('Vehiculo actualizado')),
                                                                                                );
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                primary: Color.fromARGB(255, 195, 214, 255),
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                ),
                                                                                                elevation: 5,
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                                                                child: Text(
                                                                                                  'Actualizar',
                                                                                                  style: TextStyle(
                                                                                                    fontSize: 20,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    color: Color.fromARGB(255, 0, 0, 0),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(height: 20),
                                                                                          ],
                                                                                        ),
                                                                                      )),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 20,
                                                                                  ),
                                                                                  ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(
                                                                                        textStyle: const TextStyle(
                                                                                          fontSize: 28,
                                                                                        ),
                                                                                        backgroundColor: Color.fromARGB(255, 255, 86, 86),
                                                                                        elevation: 10,
                                                                                        shadowColor: Color.fromARGB(255, 149, 179, 255),
                                                                                        minimumSize: Size(150, 70)),
                                                                                    onPressed: () {
                                                                                      showDialog(
                                                                                          context: context,
                                                                                          builder: (buildcontext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Eliminar Vehiculo'),
                                                                                              titleTextStyle: GoogleFonts.montserrat(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                                                                              content: const Text("¿Seguro que quieres eliminar este vehiculo?"),
                                                                                              contentTextStyle: GoogleFonts.hanuman(
                                                                                                color: Colors.black,
                                                                                                fontSize: 15,
                                                                                              ),
                                                                                              actions: <Widget>[
                                                                                                TextButton(
                                                                                                  onPressed: () {
                                                                                                    Navigator.pop(context);
                                                                                                  },
                                                                                                  child: Text('Cancelar', style: GoogleFonts.hanuman(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold)),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () {
                                                                                                    Navigator.pop(context);

                                                                                                    Hive.box('vehiculos').deleteAt(index);
                                                                                                    Navigator.pop(context);
                                                                                                    setState(() {
                                                                                                      Navigator.pop(context);
                                                                                                    });
                                                                                                  },
                                                                                                  child: Text('Aceptar', style: GoogleFonts.hanuman(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold)),
                                                                                                )
                                                                                              ],
                                                                                            );
                                                                                          });
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text('Eliminar Vehiculo'),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 30,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      if (value ==
                                                                          2) {}
                                                                    },
                                                                    icon: Icon(Icons
                                                                        .more_vert_outlined),
                                                                  )
                                                                ]));
                                                      }),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Datos del cliente',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 86, 140, 255),
                                                    width: 2,
                                                  ),
                                                  color: Color.fromARGB(
                                                      255, 86, 140, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 35),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Nombre: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 26,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllers[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .nombre,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Alias: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllersalias[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .alias,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Telefono: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllertelefono[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .telefono,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Telefono Adicional: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllertelefonoad[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText: clientesbox[
                                                                        index]
                                                                    .telefonoadicional,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Correo: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllercorreo[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .email,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Domicilio: ',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 26),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: TextField(
                                                              controller:
                                                                  controllerdomicilio[
                                                                      index],
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    clientesbox[
                                                                            index]
                                                                        .ciudad,
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                              ),
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          26),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 35,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            // Actualiza el nombre del cliente en la base de datos
                                                            actualizarInformacion(
                                                                index);
                                                            // Actualiza los demás campos del cliente en la base de datos
                                                            var cliente =
                                                                clientesbox[
                                                                    index];
                                                            cliente.alias =
                                                                controllersalias[
                                                                        index]
                                                                    .text;
                                                            cliente.telefono =
                                                                controllertelefono[
                                                                        index]
                                                                    .text;
                                                            cliente.telefonoadicional =
                                                                controllertelefonoad[
                                                                        index]
                                                                    .text;
                                                            cliente.email =
                                                                controllercorreo[
                                                                        index]
                                                                    .text;
                                                            cliente.ciudad =
                                                                controllerdomicilio[
                                                                        index]
                                                                    .text;
                                                            box.putAt(
                                                                index, cliente);

                                                            // Actualiza la lista de clientes para reflejar los cambios
                                                            setState(() {
                                                              clientes = box
                                                                  .values
                                                                  .toList();
                                                            });

                                                            // Muestra un mensaje de confirmación
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  content: Text(
                                                                      'Cliente actualizado')),
                                                            );
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    195,
                                                                    214,
                                                                    255),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            elevation: 5,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                            child: Text(
                                                              'Actualizar',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 35),
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }

                      if (value == 2) {
                        showDialog(
                            context: context,
                            builder: (buildcontext) {
                              return AlertDialog(
                                title: Text('Eliminar Cliente'),
                                titleTextStyle: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                content: const Text(
                                    "¿Seguro que quieres eliminar este cliente? (se eliminaran los carros agregados)"),
                                contentTextStyle: GoogleFonts.hanuman(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar',
                                        style: GoogleFonts.hanuman(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Hive.box('clientes').deleteAt(index);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text('Aceptar',
                                        style: GoogleFonts.hanuman(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    icon: Icon(Icons.more_vert_outlined),
                  )
                ]));
          }),
      floatingActionButton: BotonEspeed(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  /*void _showAlertDialog(index) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: Text(
                "¿Seguro que quieres eliminar este cliente? (se eliminaran los carros agregados)"),
            actions: <Widget>[
              FilledButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FilledButton(
                child: Text(
                  "Aceptar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Hive.box('clientes');
                  boxclientes.deleteAll(clientesbox[index]);
                  setState(() {});
                },
              )
            ],
          );
        });*/
}
