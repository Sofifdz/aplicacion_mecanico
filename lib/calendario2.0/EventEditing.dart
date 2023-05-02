import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:aplicacion_mecanico/calendario2.0/evento.dart';
import 'package:provider/provider.dart';

import 'event_provider.dart';

class EventEditingPage extends StatefulWidget {
  final Evento evento;
  const EventEditingPage({super.key, required this.evento});

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController titulocontroller = TextEditingController();
    late DateTime fromDate;
    late DateTime toDate;

    @override
    void initState() {
      super.initState();

      if (widget.evento == null) {
        fromDate = DateTime.now();
        toDate = DateTime.now().add(Duration(hours: 2));
      } else {
        final event = widget.evento;

        titulocontroller.text = event.titulo;
        fromDate = event.from;
        toDate = event.to;
      }
    }

    @override
    void dispose() {
      titulocontroller.dispose();

      super.dispose();
    }

    Future saveForm() async {
      final isValid = _formKey.currentState!.validate();

      if (isValid) {
        final event = Evento(
          titulo: titulocontroller.text,
          descripcion: 'Descripcion',
          from: fromDate,
          to: toDate,
          isallday: false,
        );

        final isEditing = widget.evento != null;
        final provider = Provider.of<EventProvider>(context, listen: false);

        if (isEditing) {
          provider.editEvent(event, widget.evento);

          Navigator.of(context).pop();
        } else {
          provider.addEvent(event);
        }

        Navigator.of(context).pop();
      }
    }

    return const Placeholder();
  }
}
