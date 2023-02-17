import 'package:daymonde_collaboration/screens/recruteur/levelStatsScreen.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';

class LevelCard extends StatelessWidget {
  LevelCard({Key? key,
    required this.title,
    required this.levelNumber,
    required this.count_level,
  }) : super(key: key);
  String title;
  final levelNumber;
  final count_level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>LevelStats(
              title: title ,
              niveaux : levelNumber,
              count_level: count_level,
              )
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              width: 150,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: orange, width: 5),
              )),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              levelNumber.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
