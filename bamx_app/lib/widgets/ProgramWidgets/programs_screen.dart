// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dummy_data.dart';
import 'programs_item.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  int chngIndx = 0;
  bool change = false;
  void setIndex(int index) {
    setState(() {
      chngIndx = index;
      change = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => StaggeredTile.count(
          ((index == chngIndx && change == true) ||
                  (index == chngIndx - 1 && chngIndx.isOdd))
              ? 2
              : 1,
          (index == chngIndx && change == true) ? 2.5 : 1),
      padding: EdgeInsets.all(15),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      itemCount: DUMMY_CATEGORIES.length,
      itemBuilder: (context, index) {
        return ProgramItem(DUMMY_CATEGORIES[index].title,
            DUMMY_CATEGORIES[index].image, setIndex, index);
      },
      // {
      //   DUMMY_CATEGORIES
      //       .map(
      //         (progData) => ProgramItem(
      //           progData.title,
      //           progData.image,
      //         ),
      //       )
      //       .toList();
      // },
    );
  }
}
