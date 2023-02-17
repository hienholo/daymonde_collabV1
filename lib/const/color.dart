import 'dart:math';

import 'package:flutter/material.dart';

const primary = Color(0xff63074D);
const blue = Color(0xff0284FE);
const orange = Color(0xffFF9500);
const yellow = Color(0xffFFC000);
const bludeBold = Color(0xff011667);
const grey = Color(0xffDEEBF7); 
const black = Color.fromARGB(221, 26, 25, 25);
const green = Color(0xff08C592);
const pink =  Color(0xffFDD2D2);
const shadow=  [
                    BoxShadow(
                      color: Color.fromARGB(255, 177, 175, 175),
                      offset: Offset(
                        .1,
                        .1,
                      ),
                      blurRadius: 0.5,
                    ), //BoxShadow
                     //BoxShadow
                  ];
const light = Color(0xffDEEBF7);


int random(min, max) {
    return min + Random().nextInt(max - min);
    
  }

  