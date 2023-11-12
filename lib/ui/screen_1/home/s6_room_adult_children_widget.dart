import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/shared/styles/colors.dart';
import '../../../providers/provider.dart';
import '../../screen_2/rooms_and_guests/s1_show_rooms_and_guests_bottomsheet.dart';

class RoomAdultChildren extends StatefulWidget {
  const RoomAdultChildren({Key? key}) : super(key: key);

  @override
  State<RoomAdultChildren> createState() => _RoomAdultChildrenState();
}

class _RoomAdultChildrenState extends State<RoomAdultChildren> {
  @override
  Widget build(BuildContext context) {
    // Access the provider to get room, adult, and children numbers
    MyProvider provider = Provider.of<MyProvider>(context);

    return InkWell(
      onTap: () {
        showRoomsAndGuestsBottomSheet();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        // Styling for the container
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Display the selected room, adult, and children numbers
            Expanded(
              child: Text(
                '${provider.roomsNumber} Room, ${provider.adultNumber} Adult, ${provider.childrenNumber} Children',
                style: const TextStyle(
                  color:mainBluePrimaryColor,
                  fontSize: 16,
                ),
              ),
            ),

            // Dropdown icon
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: greyColor,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the bottom sheet for selecting rooms and guests
  void showRoomsAndGuestsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Show the bottom sheet content
          child: const ShowRoomsAndGuestsBottomSheet(),
        );
      },
    );
  }
}
