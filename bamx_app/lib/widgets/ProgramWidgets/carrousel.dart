import './carrouselCard.dart';
import 'package:flutter/material.dart';

import '../../models/event.dart';

import '../../endpoints/programs_api.dart';

class Carrousel extends StatefulWidget {
  final String type;
  const Carrousel({super.key, required this.type});

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  int activePage = 1;
  List<Event> _typeEvents = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    _getEvents();
  }

  void _getEvents() async {
    List<Event> newList = await getRelatedEvents(widget.type);
    setState(() => _typeEvents = newList);
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  AnimatedContainer slider(dummyEvents, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: CarrouselCard(
          dummyEvents[pagePosition].title, dummyEvents[pagePosition].img),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
            itemCount: _typeEvents.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              //checking active position
              bool active = pagePosition == activePage;
              return slider(_typeEvents, pagePosition, active);
            },
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(_typeEvents.length, activePage))
      ],
    );
  }
}
