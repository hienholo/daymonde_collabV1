// ignore_for_file: file_names, prefer_const_constructors

import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
    this.couleur,
  }) : super(key: key);
  final String text;
  final Function? press;
  final Color? couleur;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          primary: Colors.white,
          backgroundColor: couleur ?? blue,
        ),
        onPressed: press as void Function()?,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: (18),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
