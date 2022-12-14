import 'package:flutter/material.dart';

class CarrouselCard extends StatelessWidget {
  final String title;
  final String image;

  CarrouselCard(this.title, this.image);

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
        //   image: DecorationImage(
        //     image: NetworkImage(image),
        //   ),
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .15,
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
          )
        ],
      ),
    );
  }
}
