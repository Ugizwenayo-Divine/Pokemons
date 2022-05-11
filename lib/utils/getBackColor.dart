import 'package:flutter/material.dart';

dynamic getBackColor(String type) {
  if (type.toLowerCase().contains('water'.toLowerCase())) {
    return Colors.blue[50];
  } else if (type.toLowerCase().contains('fire'.toLowerCase())) {
    return Colors.red[50];
  } else {
    return Colors.green[50];
  }
}
