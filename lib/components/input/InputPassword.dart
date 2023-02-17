// ignore_for_file: non_constant_identifier_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../TextFIeldContainer.dart';

class InputPassword extends StatefulWidget {
  InputPassword(
      {Key? key, required this.PasswordControler, required this.Label})
      : super(key: key);
  TextEditingController PasswordControler = TextEditingController();
  String Label = "";

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool visibl = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: passwordtext(),
    );
  }

  passwordtext() {
    return TextFormField(
      controller: widget.PasswordControler,
      obscureText: visibl,
      autocorrect: true,
      autofillHints: const [AutofillHints.password],
      //onEditingComplete: () => TextInput.finishAutofillContext(),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          suffixIcon: IconButton(
              icon: Icon(
                visibl != true ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  visibl = !visibl;
                });
              }),
          border: InputBorder.none,
          hintText: widget.Label),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Entrer password';
        } else if (value.length < 6) {
          return ' le password est court';
        }
        return null;
      },
    );
  }
}
