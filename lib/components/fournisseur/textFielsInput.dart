// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../TextFIeldContainer.dart';

class CostumInputFiels extends StatefulWidget {
  CostumInputFiels({Key? key,
    required this.Controller,
    required this.Label,
    required this.Icon
  })
      : super(key: key);
  TextEditingController Controller = TextEditingController();
  String Label = '';
  final Icon;
  @override
  State<CostumInputFiels> createState() => _CostumInputFielsState();
}

class _CostumInputFielsState extends State<CostumInputFiels> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: costumInput(),
    );
  }

  costumInput() {
    return  TextFormField(
      controller: widget.Controller,
      keyboardType: TextInputType.text,
      maxLines: 1,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        prefixIcon: widget.Icon,
          filled: true,
          fillColor: Colors.white,
          labelText: widget.Label,
          labelStyle: TextStyle(fontSize: 15),
          focusColor: Colors.black,
          contentPadding: const EdgeInsets.all(13),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.white, width: 0.8)
          )

      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Entrer un email';
        }
        return null;
      },
    );
  }
}
