// ignore_for_file: must_be_immutable

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

import '../TextFIeldContainer.dart';

/// This is a implementation of the Country State City Picker.

class CountryPicker extends StatefulWidget {
  CountryPicker({Key? key, required this.countryValue}) : super(key: key);

  TextEditingController countryValue = TextEditingController();

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  /// Variables to store country state city data in onChanged method.

  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return TextFieldContainer(
      child: Padding(
        padding: const EdgeInsets.only(top:1.0),
        child: CSCPicker(
          showStates: false,
          /// Enable disable city drop down [OPTIONAL PARAMETER]
          showCities: false,

          dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 0.5)),

          ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
          ///placeholders for dropdown search field
          countrySearchPlaceholder: "Pays...",
          stateSearchPlaceholder: "State",
          citySearchPlaceholder: "City",

          ///labels for dropdown
          countryDropdownLabel: "Pays...",
          stateDropdownLabel: "*State",
          cityDropdownLabel: "*City",

          ///Default Country
          defaultCountry: DefaultCountry.Cote_D_Ivoire_Ivory_Coast,

          ///Disable country dropdown (Note: use it with default country)
          //disableCountry: true,

          ///selected item style [OPTIONAL PARAMETER]
          selectedItemStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),

          ///DropdownDialog Heading style [OPTIONAL PARAMETER]
          dropdownHeadingStyle: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),

          ///DropdownDialog Item style [OPTIONAL PARAMETER]
          dropdownItemStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),

          ///Dialog box radius [OPTIONAL PARAMETER]
          dropdownDialogRadius: 10.0,

          ///Search bar radius [OPTIONAL PARAMETER]
          searchBarRadius: 10.0,

          ///triggers once country selected in dropdown
          onCountryChanged: (value) {
            setState(() {
              ///store value in country variable
              widget.countryValue.text = value;
              
            });
          },

          ///triggers once state selected in dropdown
          onStateChanged: (value) {
            setState(() {
              ///store value in state variable
              stateValue = value.toString();
            });
          },

          ///triggers once city selected in dropdown
          onCityChanged: (value) {
            setState(() {
              ///store value in city variable
              cityValue = value.toString();
            });
          },
        ),
      ),
    );
  }
  
}
