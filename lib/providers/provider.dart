import 'package:flutter/material.dart';

/// Provider class to manage room and guest numbers.
class MyProvider extends ChangeNotifier {
  int roomsNumber = 0;
  int adultNumber = 0;
  int childrenNumber = 0;

  /// Increases the number of rooms by 1, up to a maximum of 4.
  void addRoom() {
    if (roomsNumber < 4) {
      roomsNumber++;
      notifyListeners();
    }
  }

  /// Decreases the number of rooms by 1, ensuring it doesn't go below 0.
  void subtractRoom() {
    if (roomsNumber > 0) {
      roomsNumber--;
      notifyListeners();
    }
  }

  /// Increases the number of adults by 1, up to a maximum of 4.
  void addAdult() {
    if (adultNumber < 4) {
      adultNumber++;
      notifyListeners();
    }
  }

  /// Decreases the number of adults by 1, ensuring it doesn't go below 0.
  void subtractAdult() {
    if (adultNumber > 0) {
      adultNumber--;
      notifyListeners();
    }
  }

  /// Increases the number of children by 1, up to a maximum of 4.
  void addChildren() {
    if (childrenNumber < 4) {
      childrenNumber++;
      notifyListeners();
    }
  }

  /// Decreases the number of children by 1, ensuring it doesn't go below 0.
  void subtractChildren() {
    if (childrenNumber > 0) {
      childrenNumber--;
      notifyListeners();
    }
  }
}
