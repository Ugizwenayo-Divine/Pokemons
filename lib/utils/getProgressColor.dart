import 'package:flutter/material.dart';

dynamic getProgressColor(String baseStat) {
  if (int.parse(baseStat) / 150 < 0.4) {
    return Colors.pinkAccent[700];
  } else if (int.parse(baseStat) / 150 < 0.8) {
    return Colors.yellowAccent[700];
  } else {
    return Colors.green[700];
  }
}
