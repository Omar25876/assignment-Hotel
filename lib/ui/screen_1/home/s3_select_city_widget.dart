import 'package:flutter/material.dart';
import 'package:task_1/shared/styles/colors.dart';

class SelectCityWidget extends StatefulWidget {
  const SelectCityWidget({Key? key}) : super(key: key);

  @override
  _SelectCityWidgetState createState() => _SelectCityWidgetState();
}

class _SelectCityWidgetState extends State<SelectCityWidget> {
  String selectedCity = 'Select City';
  List<String> cities = ['Select City', 'Cairo', 'Giza', 'Alex'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(right: 4,left: 4,top: 8),
      // Container styling
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ElevatedButton(
        // ElevatedButton styling
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              color: Color.fromRGBO(206, 237, 254, 1),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(0, 12, 8, 12),
        ),
        onPressed: () {
          // Show the city menu when the button is pressed
          showCityMenu(context);
        },
        child: Center(
          child: Text(
            selectedCity,
            style: const TextStyle(
              color: mainBluePrimaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the city selection menu
  void showCityMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    // Show the menu with cities to choose from
    String? selected = await showMenu<String>(
      color: Colors.white,
      context: context,
      position: position,
      items: cities.map((city) {
        return PopupMenuItem<String>(
          value: city,
          // Styling for the menu item
          child: Text(
            city,
            style: const TextStyle(color: mainBluePrimaryColor, fontSize: 18),
          ),
        );
      }).toList(),
    );

    // Update the selected city if a new city is chosen
    if (selected != null && selected != selectedCity) {
      setState(() {
        selectedCity = selected;
      });
    }
  }
}
