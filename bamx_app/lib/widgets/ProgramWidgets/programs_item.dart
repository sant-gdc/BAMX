import 'package:flutter/material.dart';

import './program_brief.dart';
import 'program_long.dart';

class ProgramItem extends StatelessWidget {
  final String title;
  final String image;
  final String type;
  final String details;
  final String contact;
  final bool admin;
  final Function deleteProgram;
  final String id;

  final int index;

  const ProgramItem({
    super.key,
    required this.deleteProgram,
    required this.title,
    required this.image,
    required this.index,
    required this.details,
    required this.contact,
    required this.type,
    required this.admin,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.90,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: ProgramLong(
                contact: contact,
                details: details,
                image: image,
                title: title,
                type: type,
                admin: admin,
                deleteProgram: deleteProgram,
                id: id,
              )),
        );
      },
      child: ProgramBrief(
        title: type,
        image: image,
        admin: admin,
      ),
    );
  }
}
