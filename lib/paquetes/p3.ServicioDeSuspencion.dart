import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicioSuspencion extends StatefulWidget {
  const ServicioSuspencion({super.key});

  @override
  State<ServicioSuspencion> createState() => _ServicioSuspencionState();
}

class _ServicioSuspencionState extends State<ServicioSuspencion> {
  bool izqint = false;
  bool derint = false;

  bool izqext = false;
  bool izqder = false;

  bool hulizq = false;
  bool hulder = false;

  bool rotinfi = false;
  bool rotinfd = false;

  bool rotsupd = false;
  bool rotsupi = false;

  bool torizq = false;
  bool torder = false;

  bool amdeizq = false;
  bool amdeder = false;

  bool amtraizq = false;
  bool amtrader = false;

  bool gomdizq = false;
  bool gomdder = false;
  bool gomtraizq = false;
  bool gomtrader = false;

  bool horizq = false;
  bool horder = false;

  bool bhord = false;
  bool bhort = false;

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
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Servicio de Suspencion',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          title(context),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  Text(
                    'Interior',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Exterior',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 10),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: izqint,
                    onChanged: (bool? value) {
                      setState(() {
                        izqint = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 10),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: derint,
                    onChanged: (bool? value) {
                      setState(() {
                        derint = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 10),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: izqext,
                    onChanged: (bool? value) {
                      setState(() {
                        izqext = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 10),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: izqder,
                    onChanged: (bool? value) {
                      setState(() {
                        izqder = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          title2(context),
          Row(
            children: [
              SizedBox(width: 60),
              Row(
                children: [
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: hulizq,
                    onChanged: (bool? value) {
                      setState(() {
                        hulizq = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: hulder,
                    onChanged: (bool? value) {
                      setState(() {
                        hulder = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          title3(context),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  Text(
                    'Inferior',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Superior',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Text(
                        'Izquierdo',
                        style: GoogleFonts.hanuman(fontSize: 10),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: rotinfi,
                        onChanged: (bool? value) {
                          setState(() {
                            rotinfi = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Derecho',
                        style: GoogleFonts.hanuman(fontSize: 10),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: rotinfd,
                        onChanged: (bool? value) {
                          setState(() {
                            rotinfd = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Izquierdo',
                        style: GoogleFonts.hanuman(fontSize: 10),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: rotsupi,
                        onChanged: (bool? value) {
                          setState(() {
                            rotsupi = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Derecho',
                        style: GoogleFonts.hanuman(fontSize: 10),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: rotsupd,
                        onChanged: (bool? value) {
                          setState(() {
                            rotsupd = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          title4(context),
          Row(children: [
            SizedBox(
              width: 60,
            ),
            Row(
              children: [
                Text(
                  'Izquierdo',
                  style: GoogleFonts.hanuman(fontSize: 18),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: torizq,
                  onChanged: (bool? value) {
                    setState(() {
                      torizq = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Derecho',
                  style: GoogleFonts.hanuman(fontSize: 18),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: torder,
                  onChanged: (bool? value) {
                    setState(() {
                      torder = value!;
                    });
                  },
                ),
              ],
            )
          ]),
          title5(context),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text(
                'Delanteros',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: amdeizq,
                    onChanged: (bool? value) {
                      setState(() {
                        amdeizq = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: amdeder,
                    onChanged: (bool? value) {
                      setState(() {
                        amdeder = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text(
                'Traseros',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: amtraizq,
                    onChanged: (bool? value) {
                      setState(() {
                        amtraizq = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: amtrader,
                    onChanged: (bool? value) {
                      setState(() {
                        amtrader = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title6(context),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text(
                'Delanteros',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              SizedBox(
                width: 100,
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: gomdizq,
                    onChanged: (bool? value) {
                      setState(() {
                        gomdizq = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: gomdder,
                    onChanged: (bool? value) {
                      setState(() {
                        gomdder = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
              ),
              Text(
                'Traseros',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: gomtraizq,
                    onChanged: (bool? value) {
                      setState(() {
                        gomtraizq = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 14),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: gomtrader,
                    onChanged: (bool? value) {
                      setState(() {
                        gomtrader = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title7(context),
          Row(
            children: [
              SizedBox(width: 60),
              Row(
                children: [
                  Text(
                    'Izquierdo',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: horizq,
                    onChanged: (bool? value) {
                      setState(() {
                        horizq = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Derecho',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: horder,
                    onChanged: (bool? value) {
                      setState(() {
                        horder = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title8(context),
          Row(
            children: [
              SizedBox(width: 60),
              Row(
                children: [
                  Text(
                    'Delanteros',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: bhord,
                    onChanged: (bool? value) {
                      setState(() {
                        bhord = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Traseros',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: bhort,
                    onChanged: (bool? value) {
                      setState(() {
                        bhort = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
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
              'Terminal',
              style: GoogleFonts.hanuman(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 60,
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
                'Hules de la barra Est',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title3(BuildContext context) {
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
                'Rotula',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title4(BuildContext context) {
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
                'Tornillos de la barra Est',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title5(BuildContext context) {
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
                'Amortiguadores',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title6(BuildContext context) {
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
                'Gomas Amortiguadores',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title7(BuildContext context) {
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
                'Horquillas',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title8(BuildContext context) {
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
                'Bujes de Horquilla',
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
