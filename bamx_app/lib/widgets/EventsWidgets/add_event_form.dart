import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEventForm extends StatefulWidget {
  const AddEventForm({super.key});

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
    //TODO: Fix keyboard hiding textfields
    return SingleChildScrollView(
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
                  'Nuevo Evento',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Titulo del evento',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Dirección del evento',
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
            child: const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Descripción del evento',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: TextField(
              readOnly: true,
              controller: dateinput,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                labelText: 'Fecha del evento',
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: const TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
              decoration: InputDecoration(
                labelText: 'Puntos',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Cupo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
