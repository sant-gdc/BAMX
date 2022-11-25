import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEventForm extends StatefulWidget {
  final bool isEvento;
  const AddEventForm({super.key, required this.isEvento});

  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
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
                decoration: InputDecoration(
                  labelText:
                      widget.isEvento ? 'Titulo Evento' : 'Titulo Programa',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: widget.isEvento
                      ? 'Dirección del evento'
                      : 'Categoría del Programa',
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
                maxLines: 5,
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
                      controller: dateinput,
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
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                    ),
                  )
                : const SizedBox(),
            Container(
              margin: widget.isEvento
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : const EdgeInsets.only(right: 20, left: 20, bottom: 40),
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                decoration: InputDecoration(
                  labelText: widget.isEvento ? 'Puntos' : 'Número de Contacto',
                ),
              ),
            ),
            widget.isEvento
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Cupo',
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
