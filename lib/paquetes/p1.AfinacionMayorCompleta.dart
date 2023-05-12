import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Paquete1 extends StatefulWidget {
  const Paquete1({super.key});

  @override
  State<Paquete1> createState() => _Paquete1State();
}

class _Paquete1State extends State<Paquete1> {
  bool isChecked = false;
  bool isused = false;
  bool isCheckedaire = false;

  bool isCheckedi = false;
  bool isusedplatino = false;
  bool isCheckedaceite = false;

  bool isChecked8 = false;
  bool isusediridium = false;
  bool isCheckedgasolina = false;

  bool isChecked4 = false;
  bool isused5w30 = false;
  bool isChecked15w = false;

  bool isChecked5 = false;
  bool isused10w30 = false;
  bool isChecked20w = false;

  bool isChecked6 = false;
  bool isused15w30 = false;

  bool isCheckedcabron = false;
  bool isusedliq = false;
  bool isCheckedpvc = false;

  bool isCheckedcables = false;
  bool isusedtapa = false;
  bool isCheckedrotor = false;

  bool isCheckedanticon = false;
  bool isCheckedceitehidra = false;
  bool isCheckedtrans = false;

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
      child:
          ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Afinacion mayor completa',
          style:
              GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        title(context),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              '4',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text(
              'Normal',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isused,
              onChanged: (bool? value) {
                setState(() {
                  isused = value!;
                });
              },
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              'Aire',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedaire,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedaire = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              '6',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedi,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedi = value!;
                });
              },
            ),
            Text(
              'Platino',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isusedplatino,
              onChanged: (bool? value) {
                setState(() {
                  isusedplatino = value!;
                });
              },
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              'Aceite',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedaceite,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedaceite = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              '8',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked8,
              onChanged: (bool? value) {
                setState(() {
                  isChecked8 = value!;
                });
              },
            ),
            Text(
              'Iridium',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isusediridium,
              onChanged: (bool? value) {
                setState(() {
                  isusediridium = value!;
                });
              },
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              'Gasolina',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedgasolina,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedgasolina = value!;
                });
              },
            ),
          ],
        ),
        title2(context),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              '4',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked4,
              onChanged: (bool? value) {
                setState(() {
                  isChecked4 = value!;
                });
              },
            ),
            Text(
              '5w/30',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isused5w30,
              onChanged: (bool? value) {
                setState(() {
                  isused5w30 = value!;
                });
              },
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              '15w/40',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked15w,
              onChanged: (bool? value) {
                setState(() {
                  isChecked15w = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              '5',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked5,
              onChanged: (bool? value) {
                setState(() {
                  isChecked5 = value!;
                });
              },
            ),
            Text(
              '10w/30',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isused10w30,
              onChanged: (bool? value) {
                setState(() {
                  isused10w30 = value!;
                });
              },
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              '20w/50',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked20w,
              onChanged: (bool? value) {
                setState(() {
                  isChecked20w = value!;
                });
              },
            ),
          ],
        ),
        Row(children: [
          SizedBox(
            width: 20,
          ),
          Text(
            '6',
            style: GoogleFonts.hanuman(fontSize: 18),
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked6,
            onChanged: (bool? value) {
              setState(() {
                isChecked6 = value!;
              });
            },
          ),
          Text(
            '15w/30',
            style: GoogleFonts.hanuman(fontSize: 18),
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isused15w30,
            onChanged: (bool? value) {
              setState(() {
                isused15w30 = value!;
              });
            },
          ),
        ]),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Carbcln',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedcabron,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedcabron = value!;
                });
              },
            ),
            Text(
              'Liq.Inj',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isusedliq,
              onChanged: (bool? value) {
                setState(() {
                  isusedliq = value!;
                });
              },
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'PVC',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedpvc,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedpvc = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Cables',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedcables,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedcables = value!;
                });
              },
            ),
            Text(
              'Tapa/Dist',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isusedtapa,
              onChanged: (bool? value) {
                setState(() {
                  isusedtapa = value!;
                });
              },
            ),
            Text(
              'Rotor',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedrotor,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedrotor = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Anticongelante',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedanticon,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedanticon = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Aceite Dir. Hidraulica',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedceitehidra,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedceitehidra = value!;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Aceite de Transmison Aut.',
              style: GoogleFonts.hanuman(fontSize: 18),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isCheckedtrans,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedtrans = value!;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ]),
    ));
  }

  Widget title(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        color: Colors.blue,
        child: Row(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Cambio de bujias',
              style: GoogleFonts.hanuman(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              'Cambio de filtro',
              style: GoogleFonts.hanuman(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )
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
              'Cambio de Aceite',
              style: GoogleFonts.hanuman(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
