import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:task_1/shared/styles/colors.dart';

class PetFriendlyWidget extends StatefulWidget {
  const PetFriendlyWidget({Key? key}) : super(key: key);

  @override
  State<PetFriendlyWidget> createState() => _PetFriendlyWidgetState();
}

class _PetFriendlyWidgetState extends State<PetFriendlyWidget> {
  bool isPetFriendly = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shadowColor: Colors.grey.shade300,
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderOnForeground: true,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Expanded(
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    'Pet-friendly',
                    style: TextStyle(
                      fontSize: 18,
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.info_outline,
                    color: greyColor,
                    size: 24,
                  ),
                ],
              ),
              subtitle: Text(
                'Only show stays that allow pets',
                style: TextStyle(
                  fontSize: 14,
                  color: greyColor,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 8),
            child: FlutterSwitch(
              inactiveColor: const Color.fromRGBO(217, 217, 218, 1),
              width: 70.0,
              height: 40.0,
              toggleSize: 30.0,
              value: isPetFriendly,
              borderRadius: 40.0,
              showOnOff: false,
              onToggle: (val) {
                setState(() {
                  isPetFriendly = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
