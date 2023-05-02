import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reportes extends StatelessWidget {
  const Reportes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Reportes'),
        titleTextStyle:
            GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
