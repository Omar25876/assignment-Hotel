import 'package:flutter/material.dart';
import 'package:task_1/shared/styles/colors.dart';

class DateRangeWidget extends StatefulWidget {
  const DateRangeWidget({Key? key}) : super(key: key);

  @override
  State<DateRangeWidget> createState() => _DateRangeWidgetState();
}

class _DateRangeWidgetState extends State<DateRangeWidget> {
  // Default date range with current date and the next day
  DateTimeRange picked = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 1)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 4,left: 4,top: 16),
      // Styling for the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue, // Set border color to blue
        ),
        color: Colors.white, // Set background color to white
      ),
      child: ElevatedButton(
        // Styling for the ElevatedButton
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          elevation: const MaterialStatePropertyAll(0.0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: mainBluePrimaryColor, width: 1),
            ),
          ),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.fromLTRB(0, 12, 0, 12)),
        ),
        onPressed: () {
          pickDateRange();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  '${picked.start.year}/${picked.start.month}/${picked.start.day} ==> ${picked.end.year}/${picked.end.month}/${picked.end.day} ',
                  style: const TextStyle(
                    color: mainBluePrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Close icon to clear the date range
            const Expanded(flex: 2, child: Icon(Icons.close, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // Function to pick a date range using the Date Range Picker
  Future<void> pickDateRange() async {
    // Show Date Range Picker
    picked = (await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ))!;

    // Update the UI to reflect the selected date range
    setState(() {});
  }
}
