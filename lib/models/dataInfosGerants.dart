import 'dart:io';

import 'package:flutter/material.dart';

class DataInfosGerant {
  List<String> domaine_activite = [
    'Ordianteur',
    'Tablette',
    'Mode femme',
  ];
  List<Map> availableHobbies = [
    {"name": "Ordianteur", "isChecked": false},
    {"name": "Tablette", "isChecked": false},
    {"name": "Mode femme", "isChecked": false},
  ];

  String selectedValue = "A";
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("== Villes ==",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          value: "A"
      ),
      DropdownMenuItem(
          child: Text("Abidjan"),
          value: "Abidjan"
      ),
      DropdownMenuItem(
          child: Text("Bouaké"),
          value: "Bouaké"
      ),
      DropdownMenuItem(
          child: Text("San-pedro"),
          value: "San-pedro"
      ),
      DropdownMenuItem(
          child: Text("Yamoussoukro"),
          value: "Yamoussoukro"
      ),
    ];
    return menuItems;
  }



}