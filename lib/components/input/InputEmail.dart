// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../TextFIeldContainer.dart';

class InputEmail extends StatefulWidget {
  InputEmail({Key? key, required this.EmailController, required this.Label})
      : super(key: key);
  TextEditingController EmailController = TextEditingController();
  String Label = '';
  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: emailtext(),
    );
  }

  emailtext() {
    return TextFormField(
      controller: widget.EmailController,
      //autofillHints: const [AutofillHints.email],
      //onEditingComplete: () => TextInput.finishAutofillContext(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: Icon(Icons.email),
        border: InputBorder.none,
        hintText: widget.Label,
      ),
      onChanged: (value) {
        validateEmail(value);
        },
      validator: (value) {
        if(value!.isEmpty){
          return "Entrer un email";
        }else{
          return null ;
        }

      },
    );
  }
  bool validateEmail(String value) {
    RegExp regex = new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return (!regex.hasMatch(value)) ? false : true;
  }
}


