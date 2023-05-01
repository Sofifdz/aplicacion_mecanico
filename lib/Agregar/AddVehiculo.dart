import 'dart:io';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../clases/vehiculo.dart';
//import 'package:mecanico_nuevo/clases/claseVehiculo.dart';

class VAgregarVehiculo extends StatefulWidget {
  const VAgregarVehiculo({super.key});
  @override
  State<VAgregarVehiculo> createState() => _VAgregarVehiculoState();
}

class _VAgregarVehiculoState extends State<VAgregarVehiculo> {
  final _formKey = GlobalKey<FormState>();
  var boxclientess = Hive.openBox('clientes');
  var boxclientes = Hive.box('clientes').values.toList();
  final TextEditingController imagencontroller = TextEditingController();
  final TextEditingController marcacontroller = TextEditingController();
  final TextEditingController modelocontroller = TextEditingController();
  final TextEditingController aniocontroller = TextEditingController();
  final TextEditingController motorcontroller = TextEditingController();
  final TextEditingController clientecontroller = TextEditingController();
  final TextEditingController colorcontroller = TextEditingController();
  final TextEditingController vncontroller = TextEditingController();
  final TextEditingController kmscontroller = TextEditingController();
  final TextEditingController placascontroller = TextEditingController();
  final fechaController = TextEditingController();

  File? _imageFile;
  final _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('Imagen no seleccionada');
      }
    });
  }

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    fechaController.dispose();
    super.dispose();
  }

  void _showDateTimePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onChanged: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
          fechaController.text =
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
        });
      },
      currentTime: _selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    List<String> list = [];
    for (int year = 1990; year <= currentYear; year++) {
      list.add(year.toString());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar vehiculo'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: _imageFile != null
                        ? Image.file(
                            _imageFile!,
                            fit: BoxFit.fitWidth,
                            height: 200,
                          )
                        : Container(
                            height: 200,
                            color: Color.fromARGB(162, 134, 134, 134),
                          ),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: Icon(Icons.camera_alt, size: 40)),
                ],
              ),
            ],
          ),
          Column(children: [
            SizedBox(
              height: 230,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Marca',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la marca';
                      }
                      return null;
                    },
                    controller: marcacontroller,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Modelo',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el modelo';
                      }
                      return null;
                    },
                    controller: modelocontroller,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
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
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Año',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      aniocontroller.text = value.toString();
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
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
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Motor',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el motor';
                      }
                      return null;
                    },
                    controller: motorcontroller,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
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
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Color',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el color';
                      }
                      return null;
                    },
                    controller: colorcontroller,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
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
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Vin',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 75,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escriba el Vin';
                      }
                      return null;
                    },
                    controller: vncontroller,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
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
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Kms',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 53,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe los Kms';
                      }
                      return null;
                    },
                    controller: kmscontroller,
                    keyboardType:
                        TextInputType.number, // Define el teclado a usar
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter
                          .digitsOnly // Permite solo números
                    ],
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
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
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Placas',
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escriba las placas';
                      }
                      return null;
                    },
                    controller: placascontroller,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
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
                Text(
                  'Fecha de agregado',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(87, 141, 142, 143),
                      filled: true,
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: _showDateTimePicker,
                    controller: fechaController
                      ..text =
                          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  ),
                ),
                SizedBox(
                  width: 100,
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
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue[900],
                    minimumSize: Size(150, 60),
                  ),
                  child: Text('Cancelar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    Navigator.pop(
                        context,
                        Vehiculo(
                          imagen: imagencontroller.text,
                          marca: marcacontroller.text,
                          modelo: modelocontroller.text,
                          anio: aniocontroller.text,
                          motor: motorcontroller.text,
                          color: colorcontroller.text,
                          vn: vncontroller.text,
                          kms: double.parse(kmscontroller.text),
                          placas: placascontroller.text,
                          fecha: fechaController.text,
                          cliente: clientecontroller.text,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.blue[900],
                    minimumSize: Size(150, 60),
                  ),
                  child: Text('Agregar Vehiculo'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ])
        ],
      )),
    );
  }
}