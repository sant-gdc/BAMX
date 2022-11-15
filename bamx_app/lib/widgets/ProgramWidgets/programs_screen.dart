// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
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
  bool change = true;
  void setIndex(int index, bool chng) {
    setState(() {
      chngIndx = index;
      change = chng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => StaggeredTile.fit(
          ((index == chngIndx && change == true) ||
                  (index == chngIndx - 1 && chngIndx.isOdd))
              ? 2
              : 1),
      padding: EdgeInsets.all(15),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      itemCount: DUMMY_CATEGORIES.length,
      itemBuilder: (context, index) {
        return AnimatedContainer(
            duration: const Duration(seconds: 10),
            curve: Curves.easeInOutCubic,
            child: chngIndx == index
                ? ProgramItem(
                    title: DUMMY_CATEGORIES[index].title,
                    image: DUMMY_CATEGORIES[index].image,
                    setIndex: setIndex,
                    index: index,
                    selected: false)
                : ProgramItem(
                    title: DUMMY_CATEGORIES[index].title,
                    image: DUMMY_CATEGORIES[index].image,
                    setIndex: setIndex,
                    index: index,
                    selected: true));
      },
    );
  }
}
