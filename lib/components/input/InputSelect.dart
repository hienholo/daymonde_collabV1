
// ignore_for_file: must_be_immutable

import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:flutter/material.dart';

class SelectString extends StatefulWidget {
   SelectString({ Key? key,
     required this.Entree,
     required this.Sortie,
     required this.titre }) : super(key: key);
  List Entree;
  dynamic Sortie;
  String titre='';
  @override
  State<SelectString> createState() => _SelectStringState();
}

class _SelectStringState extends State<SelectString> {
  dynamic? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return  
   TextFieldContainer(
     child: DropdownButton<dynamic>(
       hint: Text(widget.titre,textAlign:TextAlign.center,),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 13,
        elevation: 16,
        style: const TextStyle(color: Color.fromARGB(255, 238, 90, 32),fontSize: 14),
        borderRadius: const BorderRadius.all( Radius.circular(20) ),
        dropdownColor: const Color.fromARGB(255, 255, 249, 249),
        // items:[{'id':1,"unité":'m'},{'id':2,"unité":'km'},{'id':3,"unité":'dam'}]
        items:widget.Entree.map<DropdownMenuItem<dynamic>>((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                    value: value['value'],
                    child: Text(value['value']),
                  );
        }).toList(),
       onChanged: (dynamic newValue) {
         setState(() {
           widget.Sortie = newValue!.toString();
           dropdownValue=newValue.toString();
         });
       },
      ),
   );
  }
}