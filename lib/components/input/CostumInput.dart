// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../TextFIeldContainer.dart';

class CostumInput extends StatefulWidget {
  CostumInput({Key? key, required this.Controller, required this.Label})
      : super(key: key);
  TextEditingController Controller = TextEditingController();
  String Label = '';
  @override
  State<CostumInput> createState() => _CostumInputState();
}

class _CostumInputState extends State<CostumInput> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: costumInput(),
    );
  }

  costumInput() {
    return TextFormField(
      controller: widget.Controller,
      //autofillHints: const [AutofillHints.email],
      //onEditingComplete: () => TextInput.finishAutofillContext(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 15),
        hintText: widget.Label,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey, width: 0.5)
          )
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ce champs est vid';
        }

        return null;
      },
    );
  }
}
