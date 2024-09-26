import 'package:flutter/material.dart';

class ChipColors {
  // Function to get the default chip color based on the pain level
  static Color getDefaultChipColor(int level) {
    switch (level) {
      case 1:
        return Colors.green[200]!;
      case 2:
        return Colors.lightGreen[200]!;
      case 3:
        return Colors.yellow[200]!;
      case 4:
        return Colors.orange[200]!;
      case 5:
        return Colors.red[200]!;
      case 6:
        return Colors.redAccent[200]!;
      case 7:
        return Colors.pink[200]!;
      case 8:
        return Colors.deepPurple[200]!;
      case 9:
        return Colors.blue[200]!;
      case 10:
        return Colors.blueAccent[200]!;
      default:
        return Colors.grey; // Fallback color
    }
  }

  // Function to get the selected chip color based on the pain level
  static Color getSelectedChipColor(int level) {
    switch (level) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.lightGreen;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.red;
      case 6:
        return Colors.redAccent;
      case 7:
        return Colors.pink;
      case 8:
        return Colors.deepPurple;
      case 9:
        return Colors.blue;
      case 10:
        return Colors.blueAccent;
      default:
        return Colors.grey; // Fallback color
    }
  }
}
