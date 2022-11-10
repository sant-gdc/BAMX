import 'package:bamx_app/widgets/ProgramWidgets/programs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import './program_brief.dart';
import './program.long.dart';

class ProgramItem extends StatelessWidget {
  final String title;
  final String image;
  final Function setIndex;
  final int index;
  final bool selected;

  ProgramItem(
      {required this.title,
      required this.image,
      required this.setIndex,
      required this.index,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setIndex(index, true);
      },
      child: selected ? ProgramBrief(title, image) : ProgramLong(title, image),
    );
  }
}
