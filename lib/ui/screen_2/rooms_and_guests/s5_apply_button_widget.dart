import 'package:flutter/material.dart';
import 'package:task_1/shared/styles/colors.dart';

class ApplyButtonWidget extends StatelessWidget {
  const ApplyButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
              const MaterialStatePropertyAll(mainBluePrimaryColor),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(0, 16, 0, 16)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Apply',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
