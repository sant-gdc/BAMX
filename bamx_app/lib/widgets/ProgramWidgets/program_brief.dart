import 'package:flutter/material.dart';

class ProgramBrief extends StatelessWidget {
  final bool admin;
  final String title;
  final String image;

  const ProgramBrief(
      {required this.title,
      required this.image,
      required this.admin,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(1, 3),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .10,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(15), topEnd: Radius.circular(15)),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .06,
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
