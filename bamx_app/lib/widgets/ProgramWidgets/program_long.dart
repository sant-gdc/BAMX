// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import './carrousel.dart';

class ProgramLong extends StatelessWidget {
  final String title;
  final String image;

  const ProgramLong(this.title, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(15), topEnd: Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Colecta de Ropa",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.notifications_none,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.info_outline,
                        ),
                      ),
                      Text(
                        "De que se trata la colecta de ropa...",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.phone,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Número de contacto para más información.",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27),
                  child: Text(
                    "Próximos eventos...",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Carrousel(
          title: title,
        )),
      ],
    );
  }
}