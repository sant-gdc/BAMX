// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dummy_data.dart';
import 'programs_item.dart';
import '../EventsWidgets/add_event_form.dart';

class ProgramsScreen extends StatefulWidget {
  final bool admin;
  const ProgramsScreen({super.key, required this.admin});

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  int chngIndx = 0;
  bool change = true;

  void createEvent(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          child: GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: const AddEventForm(
              isEvento: false,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Stack(
          children: [
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              padding: EdgeInsets.all(15),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              itemCount: DUMMY_CATEGORIES.length,
              itemBuilder: (context, index) {
                return ProgramItem(
                  title: DUMMY_CATEGORIES[index].title,
                  image: DUMMY_CATEGORIES[index].image,
                  index: index,
                );
              },
            ),
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.37,
              right: 20,
              child: Align(
                alignment: Alignment.bottomRight,
                child: widget.admin
                    ? FloatingActionButton(
                        onPressed: () => createEvent(context),
                        backgroundColor: Colors.redAccent,
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ))
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
