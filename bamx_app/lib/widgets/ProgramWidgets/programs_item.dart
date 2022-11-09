import 'package:bamx_app/widgets/ProgramWidgets/programs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import './program_brief.dart';
import './program.long.dart';

class ProgramItem extends StatefulWidget {
  final String title;
  final String image;
  final Function setIndex;
  final int index;

  ProgramItem(this.title, this.image, this.setIndex, this.index);

  @override
  State<ProgramItem> createState() => _ProgramItemState();
}

class _ProgramItemState extends State<ProgramItem> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          widget.setIndex(widget.index);
        });
      },
      child: selected
          ? ProgramBrief(widget.title, widget.image)
          : ProgramLong(widget.title, widget.image),
    );
  }
}
