// ignore_for_file: file_names

import 'package:flutter/material.dart';


enum RecrutChoice { vendeurs, fournisseurs, deux }

class MyRadioButtons extends StatelessWidget {
  MyRadioButtons(
      {Key? key,
      required this.title,
      required this.value,
      required this.selectedRecrutChoiceType,
      required this.onChanged})
      : super(key: key);

  String title;
  RecrutChoice value;
  RecrutChoice? selectedRecrutChoiceType;
  Function(RecrutChoice?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(1, 1), blurRadius: 4, color: Colors.grey)
              ]),
          child: RadioListTile<RecrutChoice>(
              value: value,
              groupValue: selectedRecrutChoiceType,
              title: Text('Recruter des $title',
                  style: const TextStyle(fontSize: 20)),
              onChanged: onChanged),
        ),
      ),
    );
  }
}
