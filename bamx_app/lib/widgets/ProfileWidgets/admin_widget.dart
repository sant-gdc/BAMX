import 'package:flutter/material.dart';

class AdminWidget extends StatelessWidget {
  final String imageP;
  final String vision;
  final String contacts;

  const AdminWidget({
    Key? key,
    required this.imageP,
    required this.vision,
    required this.contacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildImage(),
        buildInformation(),
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
        const Text(
          'BAMX Guadalajara',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Card(
          margin: const EdgeInsets.only(left: 30, right: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: SizedBox(
            width: 400,
            height: 150,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.center,
              child: Text(
                vision,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(20)),
        Text(
          contacts,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
      ],
    );
  }
}
