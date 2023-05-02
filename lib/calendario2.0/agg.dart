import 'package:aplicacion_mecanico/calendario2.0/evento.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_mecanico/calendario2.0/event_provider.dart';
import 'package:aplicacion_mecanico/calendario2.0/utils.dart';

class AgregarCita extends StatefulWidget {
  //inal Evento? evento;
  const AgregarCita({
    super.key,
  });

  @override
  State<AgregarCita> createState() => _AgregarCitaState();
}

class _AgregarCitaState extends State<AgregarCita> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titulocontroller = TextEditingController();
  late DateTime fromDate = DateTime.now();
  late DateTime toDate = DateTime.now().add(Duration(hours: 2));

  @override
  void iniState() {
    super.initState();
    fromDate = DateTime.now();
    /* if (widget.evento == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }*/
  }

  @override
  void dispose() {
    titulocontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: acciones(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Titulo(context),
              SizedBox(
                height: 12,
              ),
              Datetimepickers(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> acciones() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          onPressed: saveForm,
          icon: Icon(Icons.save),
          label: Text('SAVE'),
        ),
      ];

  Widget Titulo(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 24),
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Nombre de la cita',
      ),
      onFieldSubmitted: (_) => saveForm(),
      validator: (value) =>
          value != null && value.isEmpty ? 'Agrega un nombre' : null,
      controller: titulocontroller,
    );
  }

  Widget Datetimepickers(BuildContext context) {
    return Column(
      children: [
        buildFrom(context),
        buildTo(context),
      ],
    );
  }

  Widget buildFrom(BuildContext context) {
    return builHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: builDropdownField(
                    text: Utils.toDate(fromDate),
                    onClicked: () {
                      pickFromDateTime(pickDate: true);
                    })),
            Expanded(
                child: builDropdownField(
                    text: Utils.toTime(fromDate),
                    onClicked: () {
                      pickFromDateTime(pickDate: false);
                    }))
          ],
        ));
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);

    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );

    if (date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2102),
      );
      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeofDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeofDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);

      final time = Duration(
        hours: timeofDay.hour,
        minutes: timeofDay.minute,
      );
      return date.add(time);
    }
  }

  Widget buildTo(BuildContext context) {
    return builHeader(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: builDropdownField(
                    text: Utils.toDate(fromDate),
                    onClicked: () {
                      pickToDateTime(pickDate: true);
                    })),
            Expanded(
                child: builDropdownField(
                    text: Utils.toTime(fromDate),
                    onClicked: () {
                      pickToDateTime(pickDate: false);
                    }))
          ],
        ));
  }

  Widget builDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down_rounded),
        onTap: onClicked,
      );

  Widget builHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

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

      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);

      Navigator.of(context).pop();
    }
  }
}
