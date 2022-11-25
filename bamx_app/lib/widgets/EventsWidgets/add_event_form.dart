import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEventForm extends StatefulWidget {
  final bool isEvento;
  final Function sendData;

  const AddEventForm({
    super.key,
    required this.isEvento,
    required this.sendData,
  });

  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  //controllers
  final TextEditingController _dateinput = TextEditingController();
  late DateTime _newDate;

  final _titleController = TextEditingController();
  final _dirCatController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _pointNumController = TextEditingController();
  final _contactController = TextEditingController();
  final _cupoController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void initState() {
    _dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  void submitData() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Añadir Evento'),
            content: const Text('¿Segur@ de añadir este evento?'),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              ElevatedButton(
                onPressed: () {
                  if (widget.isEvento) {
                    widget.sendData(
                      _titleController.text,
                      _typeController.text,
                      _descriptionController.text,
                      _dirCatController.text,
                      _newDate,
                      int.parse(_pointNumController.text),
                      int.parse(_cupoController.text),
                    );

                    //close alert and modal
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else {
                    widget.sendData(
                      _titleController.text,
                      _typeController.text,
                      _descriptionController.text,
                      _contactController.text,
                    );

                    //close alert and modal
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Aceptar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.red,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_box_rounded,
                    size: 40,
                  ),
                  Text(
                    widget.isEvento ? 'Nuevo Evento' : 'Nuevo Programa',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText:
                      widget.isEvento ? 'Titulo Evento' : 'Titulo Programa',
                ),
              ),
            ),
            widget.isEvento
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _dirCatController,
                      decoration: const InputDecoration(
                        labelText: 'Dirección del evento',
                      ),
                    ),
                  )
                : const SizedBox(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _typeController,
                decoration: const InputDecoration(
                  labelText: 'Programa',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: widget.isEvento
                      ? 'Descripción del evento'
                      : 'Descripción del Programa',
                  border: InputBorder.none,
                ),
              ),
            ),
            widget.isEvento
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      readOnly: true,
                      controller: _dateinput,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.date_range),
                        labelText: 'Fecha del Evento',
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          _newDate = pickedDate;
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            _dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                    ),
                  )
                : const SizedBox(),
            widget.isEvento
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _pointNumController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Puntos',
                      ),
                    ),
                  )
                : Container(
                    margin:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 40),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _contactController,
                      decoration: const InputDecoration(
                        labelText: 'Número de Contacto',
                      ),
                    ),
                  ),
            widget.isEvento
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _cupoController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Cupo',
                      ),
                    ),
                  )
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: submitData,
                child: Text(
                  'Crear Nuevo',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
