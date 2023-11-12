import 'package:flutter/material.dart';
import 'package:task_1/shared/styles/colors.dart';

class SelectNationalityWidget extends StatefulWidget {
  const SelectNationalityWidget({Key? key}) : super(key: key);

  @override
  State<SelectNationalityWidget> createState() =>
      _SelectNationalityWidgetState();
}

class _SelectNationalityWidgetState
    extends State<SelectNationalityWidget> {
  // Default selected nationality
  String selectedNationality = 'Select Nationality';

  // List of available nationalities
  List<String> nationalities = [
    'Select Nationality',
    'Egyptian',
    'Sudanese',
    'Syrian',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4,left: 4,top: 16),
      child: DropdownButtonFormField(
        // Set the current selected value
        value: selectedNationality,
        // Styling for the dropdown text
        style: const TextStyle(
          color: mainBluePrimaryColor,
          fontSize: 18,
        ),
        // Alignment of the dropdown icon
        alignment: Alignment.center,
        // Dropdown icon
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: greyColor,
          size: 32,
        ),
        // Dropdown items
        items: nationalities.map((nationality) {
          return DropdownMenuItem(
            // Set the value for each item
            value: nationality,
            // Displayed text for each item
            child: Text(
              nationality,
              style: const TextStyle(
                color: mainBluePrimaryColor,
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
        // Callback when a new item is selected
        onChanged: (value) {
          setState(() {
            selectedNationality = value!;
          });
        },
        // Styling for the input decoration
        decoration: InputDecoration(
          labelText: '',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: '',
          helperText: '',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.transparent, // Transparent focused border color
            ),
          ),
        ),
      ),
    );
  }
}
