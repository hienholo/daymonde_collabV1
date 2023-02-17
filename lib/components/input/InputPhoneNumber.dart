// ignore_for_file: non_constant_identifier_names, must_be_immutable, avoid_print

import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InputPhoneNumber extends StatefulWidget {
  InputPhoneNumber({Key? key, required this.PhoneNumberController, required this.Label})
      : super(key: key);
  TextEditingController PhoneNumberController = TextEditingController();
  final Label;

  @override
  State<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  var textInputType = const TextInputType.numberWithOptions(signed: true, decimal: true);
  TextEditingController PhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        child: Stack(
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
             widget.PhoneNumberController.text = number.phoneNumber.toString();

              },
              onInputValidated: (bool value) {
                print(value);
              },
              // ignore: prefer_const_constructors
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              locale: 'FR',
              initialValue: PhoneNumber(isoCode: 'CI'),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              textFieldController:PhoneNumberController,
              formatInput: false,
              // ignore: prefer_const_constructors
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 14),
                border: InputBorder.none,
                labelText: widget.Label//'Numéro de téléphone',
              ),
              keyboardType: textInputType,
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                setState(() {
                   //widget.PhoneNumberController.text =number.dialCode.toString()+PhoneNumberController.text;
                   widget.PhoneNumberController.text =number.dialCode.toString()+PhoneNumberController.text;
                   print(widget.PhoneNumberController);
                });
              },
            ),
            Positioned(
              left: 90,
              top: 8,
              bottom: 8,
              child: Container(
                width: 2,
                height: 30,
                color: Colors.black.withOpacity(.3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
