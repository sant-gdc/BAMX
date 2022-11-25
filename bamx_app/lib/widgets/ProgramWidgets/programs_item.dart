import 'package:flutter/material.dart';

import './program_brief.dart';
import 'program_long.dart';

class ProgramItem extends StatelessWidget {
  final String title;
  final String image;
  final String type;
  final String details;
  final String contact;

  final int index;

  const ProgramItem({
    super.key,
    required this.title,
    required this.image,
    required this.index,
    required this.details,
    required this.contact,
    required this.type,
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
              height: MediaQuery.of(context).size.height * 0.87,
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
              )),
        );
      },
      child: ProgramBrief(title, image),
    );
  }
}
