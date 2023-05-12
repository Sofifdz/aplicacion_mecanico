import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class CondicionesMotor extends StatefulWidget {
  const CondicionesMotor({super.key});

  @override
  State<CondicionesMotor> createState() => _CondicionesMotorState();
}

class _CondicionesMotorState extends State<CondicionesMotor> {
  bool isCheckedTostada = false;
  bool isCheckedRota = false;
  bool isCheckedChilla = false;
  bool isCheckedPoleaTensadora = false;
  bool isCheckedPoleaLoca = false;
  bool isCheckedGoteaBombaAgua = false;
  bool isCheckedChillaBombaAgua = false;
  bool isCheckedFanClutch = false;
  bool isCheckedBombaAceitaNormal = false;
  bool isCheckedBombaAceitaAlta = false;
  bool isCheckedBombaAceitaBaja = false;
  bool isCheckedTapaPunteriasSi = false;
  bool isCheckedTapaPunteriasNo = false;
  bool isCheckedTapaCarterSi = false;
  bool isCheckedTapaCarterNo = false;
  bool isCheckedRegistroMonoBlockSi = false;
  bool isCheckedRegistroMonoBlockNo = false;
  bool isCheckedCadenaTiempoSi = false;
  bool isCheckedCadenaTiempoNo = false;
  bool isCheckedRetenCiguenalTras = false;
  bool isCheckedRetenCiguenalDel = false;
  bool isCheckedRetenCiguenalSi = false;
  bool isCheckedRetenCiguenalNo = false;
  bool isCheckedRetenArbolLevasE = false;
  bool isCheckedRetenArbolLevasA = false;
  bool isCheckedRetenArbolLevasSi = false;
  bool isCheckedRetenArbolLevasNo = false;

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
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Condiciones del Motor',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          title(context),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Tostada',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedTostada,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedTostada = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Rota ',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedRota,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRota = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Chilla',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedChilla,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedChilla = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title2(context),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Polea Tensadora',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedPoleaTensadora,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedPoleaTensadora = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Polea Loca',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedPoleaLoca,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedPoleaLoca = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title3(context),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Gotea',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedGoteaBombaAgua,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedGoteaBombaAgua = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Chilla',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedChillaBombaAgua,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedChillaBombaAgua = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Fan clutch',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedFanClutch,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedFanClutch = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title4(context),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Normal',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedBombaAceitaNormal,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedBombaAceitaNormal = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Alta',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedBombaAceitaAlta,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedBombaAceitaAlta = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Baja',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedBombaAceitaBaja,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedBombaAceitaBaja = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          title5(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedTapaPunteriasSi,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedTapaPunteriasSi = value!;
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
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedTapaPunteriasNo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedTapaPunteriasNo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          title6(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedTapaCarterSi,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedTapaCarterSi = value!;
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
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedTapaCarterNo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedTapaCarterNo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          title7(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedRegistroMonoBlockSi,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedRegistroMonoBlockSi = value!;
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
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedRegistroMonoBlockNo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedRegistroMonoBlockNo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          title8(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Suena',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedCadenaTiempoSi,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedCadenaTiempoSi = value!;
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
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedCadenaTiempoNo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedCadenaTiempoNo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          title9(context),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Tras',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedRetenCiguenalTras,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRetenCiguenalTras = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Del',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedRetenCiguenalDel,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRetenCiguenalDel = value!;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedRetenCiguenalSi,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedRetenCiguenalSi = value!;
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
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedRetenCiguenalNo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedRetenCiguenalNo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          title10(context),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Arbol E',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedRetenArbolLevasE,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRetenArbolLevasE = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Arbol A',
                    style: GoogleFonts.hanuman(fontSize: 20),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isCheckedRetenArbolLevasA,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRetenArbolLevasA = value!;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Goteo',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Si',
                        style: GoogleFonts.hanuman(fontSize: 20),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedRetenArbolLevasSi,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedRetenArbolLevasSi = value!;
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
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isCheckedRetenArbolLevasNo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedRetenArbolLevasNo = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 50,
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
              'Banda de Alternador',
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
                'Polea Tensadora',
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
                'Bomba de Agua',
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
                'Presion de Bomba de Aceite',
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
                'Tapa de Punterias',
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
                'Tapa del Carter',
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
                'Registro Del MonoBlock',
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
                'Cadena De Tiempo',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title9(BuildContext context) {
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
                'Reten de cigueñal',
                style: GoogleFonts.hanuman(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title10(BuildContext context) {
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
                'Reten arbol de levas',
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
