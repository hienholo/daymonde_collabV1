import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InputPhoneNumber2Screen extends StatefulWidget {
  InputPhoneNumber2Screen(
      {Key? key, required this.PhoneNumberController, required this.Label})
      : super(key: key);
  TextEditingController PhoneNumberController = TextEditingController();
  final String Label;
  @override
  State<InputPhoneNumber2Screen> createState() =>
      _InputPhoneNumber2ScreenState();
}

class _InputPhoneNumber2ScreenState extends State<InputPhoneNumber2Screen> {
  var textInputType =
      const TextInputType.numberWithOptions(signed: true, decimal: true);
  TextEditingController PhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
      ),
      child: Stack(
        children: [
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
              widget.PhoneNumberController.text = number.phoneNumber.toString();
            },
            errorMessage: 'Invalid phone number',
            onInputValidated: (bool value) {
              print(value);
            },
            // ignore: prefer_const_constructors
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            locale: 'FR',
            searchBoxDecoration: const InputDecoration(
              labelText: 'Rechercher votre pays',
              labelStyle: TextStyle(
                color: Colors.blue,
              ),
              suffixIcon: Icon(Icons.search),
            ),
            initialValue: PhoneNumber(isoCode: 'CI'),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            textFieldController: PhoneNumberController,
            formatInput: false,
            // ignore: prefer_const_constructors
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 14),
              labelText: widget.Label,
              suffixIcon: const Icon(
                Icons.thumb_up,
                color: Colors.black,
              ),
              border: InputBorder.none,
            ),
            keyboardType: textInputType,
            onSaved: (PhoneNumber number) {
              setState(() {
                widget.PhoneNumberController.text =
                    number.dialCode.toString() + PhoneNumberController.text;
                print(widget.PhoneNumberController);
              });
            },
          ),
          Positioned(
            left: 90,
            top: 10,
            bottom: 10,
            child: Container(
              width: 2,
              height: 25,
              color: Colors.black.withOpacity(.3),
            ),
          )
        ],
      ),
    );
  }
}
