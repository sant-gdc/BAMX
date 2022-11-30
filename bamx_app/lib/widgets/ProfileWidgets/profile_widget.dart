import 'package:flutter/material.dart';

import './volunteer_list.dart';
import '../EventsWidgets/dummy_events.dart';

class ProfileWidget extends StatelessWidget {
  final String imageP;
  final String name;
  final String lastName;
  final String age;
  final String phone;
  final int points;

  ProfileWidget({
    Key? key,
    required this.imageP,
    required this.name,
    required this.lastName,
    required this.age,
    required this.phone,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildImage(),
        buildInformation(),
        buildPointsCard(context),
        const Padding(padding: EdgeInsets.only(top: 5, bottom: 20)),
        Container(
          padding: const EdgeInsets.only(left: 7),
          alignment: Alignment.bottomLeft,
          child: const Text(
            'Eventos Pasados',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.normal, color: Colors.red),
          ),
        ),
        SingleChildScrollView(child: VolunteerList(dummyEvents)),
      ],
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imageP);

    return Container(
      width: 175,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red, width: 7),
        image: DecorationImage(image: image, fit: BoxFit.fill),
      ),
    );
  }

  Widget buildInformation() {
    return Column(
      children: <Widget>[
        Text(
          '$name $lastName',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 10),
            Text(
              '$age años',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Text(
              '-',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              phone,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 10),
          ],
        ),
        const Padding(padding: EdgeInsets.all(5)),
      ],
    );
  }

  Widget buildPointsCard(context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => buildRanking());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 35,
              ),
              Text(
                '\t $points \t',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Puntos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade900,
                  fontSize: 20,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRanking() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 40,
      title: const Text(
        'Niveles de Ranking',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      children: <Widget>[
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.workspace_premium,
                  color: Colors.cyan,
                  size: 34,
                ),
                Text(
                  'Diamante - 500pts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.workspace_premium,
                  color: Color.fromARGB(255, 255, 204, 0),
                  size: 34,
                ),
                Text(
                  'Oro - 300pts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 204, 0),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.workspace_premium,
                  color: Color.fromARGB(255, 155, 155, 155),
                  size: 34,
                ),
                Text(
                  'Plata - 150pts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 155, 155, 155),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.workspace_premium,
                  color: Color.fromARGB(255, 189, 117, 0),
                  size: 34,
                ),
                Text(
                  'Bronce - 50pts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 189, 117, 0),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
