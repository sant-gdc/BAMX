import 'package:flutter/material.dart';

class ProfilePicEdit extends StatelessWidget {
  final String imageP;

  const ProfilePicEdit({
    Key? key,
    required this.imageP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildImage(),
        buildEditIcon(),
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

  Widget buildEditIcon() => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: Colors.red,
          all: 8,
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
