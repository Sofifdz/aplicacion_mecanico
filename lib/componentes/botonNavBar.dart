import 'package:aplicacion_mecanico/calendario2.0/ver.dart';
import 'package:aplicacion_mecanico/ventanas/Calendario.dart';
import 'package:aplicacion_mecanico/visualizacion/ver_vehiculos.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aplicacion_mecanico/visualizacion/ver_clientes.dart';
import 'package:aplicacion_mecanico/ventanas/Taller.dart';

import 'package:aplicacion_mecanico/ventanas/reportes.dart';

class BotonNav extends StatefulWidget {
  const BotonNav({super.key});

  @override
  State<BotonNav> createState() => _BotonNavState();
}

class _BotonNavState extends State<BotonNav> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Ver_clientes(),
    Ver_Vehiculos(),
    Calendariop(),
    Reportes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          color: Colors.blue[900],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: GNav(
              rippleColor: Colors.blue[200]!,
              hoverColor: Colors.blue[200]!,
              tabBorderRadius: 15,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.group,
                  text: 'Clientes',
                ),
                GButton(
                  icon: Icons.build,
                  text: 'Taller',
                ),
                GButton(
                  icon: Icons.calendar_month,
                  text: 'Calendario',
                ),
                GButton(
                  icon: Icons.receipt_long,
                  text: 'Reportes',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
