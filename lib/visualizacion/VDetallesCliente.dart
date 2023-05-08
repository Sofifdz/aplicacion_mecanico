import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class VDetallesCliente extends StatefulWidget {
  const VDetallesCliente({super.key});

  @override
  State<VDetallesCliente> createState() => _VDetallesClienteState();
}

var clientesbox = Hive.box('clientes').values.toList();
var boxclientes = Hive.box('clientes');

class _VDetallesClienteState extends State<VDetallesCliente> {
  @override
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
            var v = boxclientes.getAt(index);

            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Carros del cliente',
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade800,
                        letterSpacing: 3,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 280,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 156, 187, 255),
                                width: 2,
                              ),
                              color: Color.fromARGB(255, 156, 187, 255),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Datos del cliente',
                      style: GoogleFonts.montserrat(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade800,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 156, 187, 255),
                              width: 2,
                            ),
                            color: Color.fromARGB(255, 156, 187, 255),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Nombre: ',
                                    style: GoogleFonts.hanuman(fontSize: 26),
                                  ),
                                  Text(
                                    clientesbox[index].nombre,
                                    style: GoogleFonts.montserrat(fontSize: 26),
                                  )
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
                                    style: GoogleFonts.hanuman(fontSize: 26),
                                  )
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
                                    style: GoogleFonts.hanuman(fontSize: 26),
                                  ),
                                  Text(
                                    clientesbox[index].telefono,
                                    style: GoogleFonts.montserrat(fontSize: 26),
                                  )
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
                                    style: GoogleFonts.hanuman(fontSize: 26),
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
                                    style: GoogleFonts.hanuman(fontSize: 26),
                                  ),
                                  Text(
                                    clientesbox[index].email,
                                    style: GoogleFonts.montserrat(fontSize: 26),
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
                                    style: GoogleFonts.hanuman(fontSize: 26),
                                  ),
                                  Text(
                                    clientesbox[index].ciudad,
                                    style: GoogleFonts.montserrat(fontSize: 26),
                                  )
                                ],
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }
}
