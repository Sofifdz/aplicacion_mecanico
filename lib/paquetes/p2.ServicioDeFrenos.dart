import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

enum Opcion { si, no }

class Paquete3 extends StatefulWidget {
  const Paquete3({super.key});

  @override
  State<Paquete3> createState() => _Paquete3State();
}

class _Paquete3State extends State<Paquete3> {
  Opcion? opcionSeleccionada;
  Opcion? opcionSeleccionada2;

  bool isChecked = false;
  bool isChecked_ = false;
  bool isChecked15 = false;
  bool isChecked25 = false;
  bool isCkecked50 = false;
  bool isCkecked75 = false;
  bool isCheckeddisco = false;
  bool isCheckedrectificacion = false;
  bool isCheckeddiscIzq = false;
  bool isCheckeddiscDer = false;
  bool isCheckedcaliper = false;
  bool isCheckednormal = false;
  bool isCheckedgoteo = false;
  bool isCheckedcapilerIzq = false;
  bool isCheckedcapilerDer = false;

  bool isChecked15t = false;
  bool isChecked25t = false;
  bool isCkecked50t = false;
  bool isCkecked75t = false;
  bool isCheckeddiscot = false;
  bool isCheckedtambor = false;
  bool isCheckedrectificaciont = false;
  bool isCheckeddiscIzqt = false;
  bool isCheckeddiscDert = false;
  bool isCheckedcalipert = false;
  bool isCheckedcilindro = false;
  bool isCheckednormalt = false;
  bool isCheckedgoteot = false;
  bool isCheckedcapilerIzqt = false;
  bool isCheckedcapilerDert = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Servicio de Frenos',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          title(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    'Si',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Radio(
                    value: Opcion.si,
                    groupValue: opcionSeleccionada,
                    onChanged: (Opcion? value) {
                      setState(() {
                        opcionSeleccionada = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'No',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Radio(
                    value: Opcion.no,
                    groupValue: opcionSeleccionada,
                    onChanged: (Opcion? value) {
                      setState(() {
                        opcionSeleccionada = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    '15%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked15,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked15 = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '25%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked25,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked25 = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '50%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCkecked50,
                    onChanged: (bool? value) {
                      setState(() {
                        isCkecked50 = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '75%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCkecked75,
                    onChanged: (bool? value) {
                      setState(() {
                        isCkecked75 = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Disco',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckeddisco,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckeddisco = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rectificación',
                        style: GoogleFonts.hanuman(fontSize: 17),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedrectificacion,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedrectificacion = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Izq.',
                        style: GoogleFonts.hanuman(fontSize: 18),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckeddiscIzq,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckeddiscIzq = value!;
                          });
                        },
                      ),
                      Text(
                        'Der.',
                        style: GoogleFonts.hanuman(fontSize: 18),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckeddiscDer,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckeddiscDer = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 2,
                height: 115,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Caliper',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcaliper,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcaliper = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Normal',
                        style: GoogleFonts.hanuman(fontSize: 15),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckednormal,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckednormal = value!;
                          });
                        },
                      ),
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 15),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedgoteo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedgoteo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Izq.',
                        style: GoogleFonts.hanuman(fontSize: 18),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcapilerIzq,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcapilerIzq = value!;
                          });
                        },
                      ),
                      Text(
                        'Der.',
                        style: GoogleFonts.hanuman(fontSize: 18),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcapilerDer,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcapilerDer = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          title2(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    'Si',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Radio(
                    value: Opcion.si,
                    groupValue: opcionSeleccionada2,
                    onChanged: (Opcion? value) {
                      setState(() {
                        opcionSeleccionada2 = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'No',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Radio(
                    value: Opcion.no,
                    groupValue: opcionSeleccionada2,
                    onChanged: (Opcion? value) {
                      setState(() {
                        opcionSeleccionada2 = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    '15%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked15t,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked15t = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '25%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked25t,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked25t = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '50%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCkecked50t,
                    onChanged: (bool? value) {
                      setState(() {
                        isCkecked50t = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '75%',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCkecked75t,
                    onChanged: (bool? value) {
                      setState(() {
                        isCkecked75t = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Disco',
                        style: GoogleFonts.hanuman(fontSize: 12),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckeddiscot,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckeddiscot = value!;
                          });
                        },
                      ),
                      Text(
                        'Tambor',
                        style: GoogleFonts.hanuman(fontSize: 12),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedtambor,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedtambor = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rectificación',
                        style: GoogleFonts.hanuman(fontSize: 18),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedrectificaciont,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedrectificaciont = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Izq.',
                        style: GoogleFonts.hanuman(fontSize: 16),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckeddiscIzqt,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckeddiscIzqt = value!;
                          });
                        },
                      ),
                      Text(
                        'Der.',
                        style: GoogleFonts.hanuman(fontSize: 16),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckeddiscDert,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckeddiscDert = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 2,
                height: 115,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Caliper',
                        style: GoogleFonts.hanuman(fontSize: 12),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcalipert,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcalipert = value!;
                          });
                        },
                      ),
                      Text(
                        'Cilindro',
                        style: GoogleFonts.hanuman(fontSize: 12),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcilindro,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcilindro = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Normal',
                        style: GoogleFonts.hanuman(fontSize: 16),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckednormalt,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckednormalt = value!;
                          });
                        },
                      ),
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 16),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedgoteot,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedgoteot = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Izq.',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcapilerIzqt,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcapilerIzqt = value!;
                          });
                        },
                      ),
                      Text(
                        'Der.',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedcapilerDert,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedcapilerDert = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  Widget title(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        color: Colors.blue,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Balatas Delanteras',
              style: GoogleFonts.hanuman(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget title2(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        color: Colors.blue,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Center(
              child: Text(
                'Zapatas o Balatas Traseras',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
