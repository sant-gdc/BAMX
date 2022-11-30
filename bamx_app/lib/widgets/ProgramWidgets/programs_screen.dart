// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

import 'programs_item.dart';
import '../EventsWidgets/add_event_form.dart';
import '../../models/programs.dart';

import '../../endpoints/programs_api.dart';

class ProgramsScreen extends StatefulWidget {
  final bool admin;
  const ProgramsScreen({super.key, required this.admin});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  int chngIndx = 0;
  bool change = true;
  late List<Program> _programList = [];

  @override
  void initState() {
    super.initState();
    _fecthData();
  }

  void _fecthData() async {
    List<Program> newList = await getPrograms();
    setState(() => _programList = newList);
  }

  void _deleteProgram(String deleteId) {
    final messenger = ScaffoldMessenger.of(context);

    try {
      deletePrograms(deleteId);
      _fecthData();
      messenger.showSnackBar(
        const SnackBar(content: Text('Eliminado con Exito')),
      );
    } catch (e) {
      messenger.showSnackBar(
        const SnackBar(content: Text('No se pudo Eliminar el programa')),
      );
    }
  }

  void createProgram(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          child: GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddEventForm(
              isEvento: false,
              sendData: _addProgram,
            ),
          ),
        );
      },
    );
  }

  void _addProgram(String title, String type, String details, String contact) {
    var rng = Random();
    final newProgram = Program(
      id: rng.nextInt(1000).toString(),
      title: title,
      type: type,
      image:
          'https://www.meganoticias.mx/uploads/noticias/fundacion-hara-colecta-de-alimentos-no-perecederos-para-familias-vulnerables-192023.jpeg',
      details: details,
      contact: contact,
    );

    final messenger = ScaffoldMessenger.of(context);

    try {
      addProgram(newProgram);
      _fecthData();

      messenger.showSnackBar(
        const SnackBar(content: Text('Añadido con Exito')),
      );
    } catch (e) {
      messenger.showSnackBar(
        const SnackBar(content: Text('No se pudo añadir el programa')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          padding: EdgeInsets.all(15),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          itemCount: _programList.length,
          itemBuilder: (context, index) {
            return ProgramItem(
              title: _programList[index].title,
              image: _programList[index].image,
              contact: _programList[index].contact,
              details: _programList[index].details,
              type: _programList[index].type,
              admin: widget.admin,
              index: index,
              deleteProgram: _deleteProgram,
              id: _programList[index].id,
            );
          },
        ),
      ),
      floatingActionButton: widget.admin
          ? FloatingActionButton(
              onPressed: () => createProgram(context),
              backgroundColor: Colors.redAccent,
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ))
          : const SizedBox(),
    );
  }
}
