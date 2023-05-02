import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:aplicacion_mecanico/calendario2.0/EventEditing.dart';
import 'package:aplicacion_mecanico/calendario2.0/event_provider.dart';
import 'package:aplicacion_mecanico/calendario2.0/evento.dart';
import 'package:provider/provider.dart';

class DetallesdeCita extends StatelessWidget {
  final Evento event;

  const DetallesdeCita({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildViewActions(context, event),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          //  buildDateTime(event),
          SizedBox(
            height: 32,
          ),
          Text(
            event.titulo,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            event.descripcion,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  /* Widget buildDateTime(Evento evento) {
    return Column(
      children: [
        buildDate(evento.isallday ? 'All_day' : 'From', evento.from),
        if (!evento.isallday) buildDate('To', evento.to)
      ],
    );
  }
*/
  Widget buildDate(String titulo, String date) {
    return Container(
      decoration: BoxDecoration(
        color: event.brackound.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.titulo,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> buildViewActions(BuildContext context, Evento evento) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => EventEditingPage(evento: evento)));
          }),
      IconButton(
          onPressed: () {
            final provider = Provider.of<EventProvider>(context, listen: false);
            //provider.dele(evento);
          },
          icon: Icon(Icons.delete)),
    ];
  }
}
