import 'package:flutter/material.dart';

import './event_card.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventCard(
      'https://www.centronia.org/2016/wp-content/uploads/2016/11/DSCF7782-580x345.jpg?e7ce06&e7ce06',
      'Colecta de Ropa',
      'Colecta',
    );
  }
}
