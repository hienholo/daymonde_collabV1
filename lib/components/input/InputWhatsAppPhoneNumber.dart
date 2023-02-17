// ignore_for_file: non_constant_identifier_names, must_be_immutable, avoid_print

import 'package:daymonde_collaboration/components/TextFIeldContainer.dart';
import 'package:daymonde_collaboration/const/color.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InputWhatsAppPhoneNumber extends StatefulWidget {
  InputWhatsAppPhoneNumber({Key? key, required this.WhatsAppPhoneNumberController})
      : super(key: key);
  TextEditingController WhatsAppPhoneNumberController = TextEditingController();
  @override
  State<InputWhatsAppPhoneNumber> createState() => _InputWhatsAppPhoneNumberState();
}

class _InputWhatsAppPhoneNumberState extends State<InputWhatsAppPhoneNumber> {
  var textInputType =
      const TextInputType.numberWithOptions(signed: true, decimal: true);
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
              textFieldController: widget.WhatsAppPhoneNumberController,
              formatInput: false,
              // ignore: prefer_const_constructors
              inputDecoration: InputDecoration(
                suffixIcon: const Icon(Icons.whatsapp_sharp,color: black,),
                contentPadding: const EdgeInsets.only(bottom: 14),
                border: InputBorder.none,
              ),
              keyboardType: textInputType,
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
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
