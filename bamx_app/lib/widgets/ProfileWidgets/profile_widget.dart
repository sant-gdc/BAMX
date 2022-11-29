import 'package:flutter/material.dart';

import './volunteer_list.dart';
import '../../models/volunteer.dart';

class ProfileWidget extends StatelessWidget {
  final String imageP;
  final String name;
  final String age;
  final String phone;
  final int points;

  ProfileWidget({
    Key? key,
    required this.imageP,
    required this.name,
    required this.age,
    required this.phone,
    required this.points,
  }) : super(key: key);

  final List<Volunteer> _userVolunteer = [
    Volunteer(
      id: 'e1',
      title: 'Colecta de Medicamentos',
      points: 5,
      image: 'https://cdn-icons-png.flaticon.com/512/1098/1098028.png',
      date: DateTime.now(),
    ),
    Volunteer(
      id: 'e2',
      title: 'Colecta de Alimentos Tec',
      points: 3,
      image:
          'https://assets.website-files.com/60dd9083125eb44675d01dba/60dd9083125eb4580ad01eb6_Hero-image.png',
      date: DateTime.now(),
    ),
    Volunteer(
      id: 'e3',
      title: 'Feria de Empleos',
      points: 3,
      image: 'https://cdn-icons-png.flaticon.com/512/1462/1462435.png',
      date: DateTime.now(),
    ),
    Volunteer(
      id: 'e4',
      title: 'Organizacion en Almacen',
      points: 5,
      image: 'https://cdn-icons-png.flaticon.com/512/862/862856.png',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildImage(),
        buildInformation(),
        buildPointsCard(context),
        SingleChildScrollView(child: VolunteerList(_userVolunteer)),
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
          name,
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
              age,
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
