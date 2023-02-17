// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class ProfilCard extends StatefulWidget {
  ProfilCard(
      {Key? key,
      required this.date,
      required this.itemCount,
      required this.name,
      required this.value,
      required this.profilPicture,
      required this.CardColor})
      : super(key: key);
  int itemCount;
  final name;
  final date;
  final profilPicture;
  Widget value;
  Color CardColor;
  @override
  State<ProfilCard> createState() => _ProfilCardState();
}

class _ProfilCardState extends State<ProfilCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.CardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               CircleAvatar(
                 radius: 35,
                 backgroundImage: NetworkImage(widget.profilPicture),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10.0),
                 child: SizedBox(
                   width: size.width / 2.3,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         widget.name,
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: size.width < 350 ? 13 : 16),
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       Text(
                         widget.date,
                         style: const TextStyle(
                             fontSize: 12, color: Colors.black54),
                       )
                     ],
                   ),
                 ),
               )
             ],
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.value,
            )
          ],
        ),
      ),
    );
  }
}
