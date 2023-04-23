import 'package:flutter/material.dart';

class Reportes extends StatelessWidget {
  const Reportes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: const Text('Reportes'),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
