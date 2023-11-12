import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import 's2_hotels_search_widget.dart';
import 's3_select_city_widget.dart';
import 's4_date_range_widget.dart';
import 's5_select_nationality_widget.dart';
import 's6_room_adult_children_widget.dart';
import 's7_find_hotels_widget.dart';

class HomeWidget extends StatefulWidget {
  static const String routeName = 'Home Widget';

  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late double screenHeight;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Retrieve the screen dimensions using MediaQuery
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    // Main container with background image
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.webp'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.4),

              // Custom widget for hotel search
              HotelsSearchWidget(),

              SizedBox(height: screenHeight * 0.006),

              // Container for hotel-related information
              Container(
                decoration: BoxDecoration(
                  color: orangColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(77, 176, 246, 1),
                            mainBluePrimaryColor,
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: const Column(
                        children: [
                          // Widget to select the city
                          SelectCityWidget(),

                          // Widget to select the date range
                          DateRangeWidget(),


                          // Widget to select nationality
                          SelectNationalityWidget(),

                          // Widget for room, adults, and children selection
                          RoomAdultChildren(),
                        ],
                      ),
                    ),
                    // Widget to find hotels
                    FindHotelsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
