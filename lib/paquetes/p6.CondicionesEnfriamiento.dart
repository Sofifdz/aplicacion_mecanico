import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Paquete6 extends StatefulWidget {
  const Paquete6({super.key});

  @override
  State<Paquete6> createState() => _Paquete6State();
}

class _Paquete6State extends State<Paquete6> {
  bool isCheckedsi = false;
  bool isCheckedno = false;
  bool isCheckedanticonge = false;
  bool isCheckedagua = false;

  bool isCheckedbomano = false;
  bool isCheckedbomba = false;

  bool isCheckedtermosi = false;
  bool isCheckedtermono = false;

  bool isCheckedmaguesi = false;
  bool isCheckedmangueno = false;

  bool isCheckedtaponsi = false;
  bool isCheckedtaponno = false;

  bool isCheckednosesi = false;
  bool isCheckednoseno = false;

  bool isCheckeddepsi = false;
  bool isCheckeddepno = false;

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
            'Condiciones de Enfriamiento',
            style: GoogleFonts.montserrat(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          title(context),
          Row(
            children: [
              SizedBox(
                width: 160,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedsi,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedsi = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedno,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedno = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 31,
              ),
              Text(
                'Anticongelante',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedanticonge,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedanticonge = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 130,
              ),
              Text(
                'Agua',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedagua,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedagua = value!;
                  });
                },
              ),
            ],
          ),
          title1(context),
          Row(
            children: [
              SizedBox(
                width: 165,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedbomano,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedbomano = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 155,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedbomba,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedbomba = value!;
                  });
                },
              ),
            ],
          ),
          title2(context),
          Row(
            children: [
              SizedBox(
                width: 165,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedtermosi,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedtermosi = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 155,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedtermono,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedtermono = value!;
                  });
                },
              ),
            ],
          ),
          title3(context),
          Row(
            children: [
              SizedBox(
                width: 165,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedmaguesi,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedmaguesi = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 155,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedmangueno,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedmangueno = value!;
                  });
                },
              ),
            ],
          ),
          title4(context),
          Row(
            children: [
              SizedBox(
                width: 165,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedtaponsi,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedtaponsi = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 155,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckedtaponno,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedtaponno = value!;
                  });
                },
              ),
            ],
          ),
          title5(context),
          Row(
            children: [
              SizedBox(
                width: 160,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckednosesi,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckednosesi = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 155,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckednoseno,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckednoseno = value!;
                  });
                },
              ),
            ],
          ),
          title7(context),
          Row(
            children: [
              SizedBox(
                width: 160,
              ),
              Text(
                'si',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckeddepsi,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckeddepsi = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 155,
              ),
              Text(
                'No',
                style: GoogleFonts.hanuman(fontSize: 20),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isCheckeddepno,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckeddepno = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]));
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
              'Radiador Tapado',
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

  Widget title1(BuildContext context) {
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
              'Bomba de fuga',
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
            Text(
              'Termostato',
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
            Text(
              'Mangueras rotas',
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
            Text(
              'Tapon Fuga',
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
            Text(
              'Abrazaderas Rotas',
              style: GoogleFonts.hanuman(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
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
            Text(
              'Deposito Roto',
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
}
