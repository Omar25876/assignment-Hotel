import 'package:flutter/material.dart';
import 'package:task_1/ui/screen_2/rooms_and_guests/s5_apply_button_widget.dart';
import 'package:task_1/ui/screen_2/rooms_and_guests/s4_pet_friendly_widget.dart';
import 'package:task_1/ui/screen_2/rooms_and_guests/s3_room_details_widget.dart';
import 'package:task_1/ui/screen_2/rooms_and_guests/s2_rooms_widget.dart';

class ShowRoomsAndGuestsBottomSheet extends StatefulWidget {
  const ShowRoomsAndGuestsBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShowRoomsAndGuestsBottomSheet> createState() =>
      _ShowRoomsAndGuestsBottomSheetState();
}

class _ShowRoomsAndGuestsBottomSheetState
    extends State<ShowRoomsAndGuestsBottomSheet> {
  bool status = false;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen dimensions using MediaQuery
    screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'Rooms And Guests',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, color: Colors.black, size: 28),
              ),
            ],
          ),

          // Content Section
          Container(
            padding: EdgeInsets.all(8),
            color: Color.fromRGBO(235, 236, 237, 1),
            child: Column(
              children: [
                // Rooms Widget
                RoomsWidget(),

                SizedBox(height: screenHeight * 0.02),

                // Room Details Widget
                RoomDetailsWidget(),

                SizedBox(height: screenHeight* 0.02),

                // Pet Friendly Widget
                PetFriendlyWidget(),

                SizedBox(height:screenHeight * 0.15),

                // Apply Button Widget
                ApplyButtonWidget(),

                SizedBox(height:screenHeight * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
