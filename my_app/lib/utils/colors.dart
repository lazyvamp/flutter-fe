import 'package:flutter/material.dart';

class ColorUtils {
  static Map COLOR_MAP = {
    "white": Colors.white,
    "grey": Colors.grey,
    "black": Colors.black,
    "grey.shade100": Colors.grey.shade100,
    "grey.shade200": Colors.grey.shade200,
    "grey.shade300": Colors.grey.shade300,
    "grey.shade400": Colors.grey.shade400,
    "grey.shade500": Colors.grey.shade500,
    "grey.shade600": Colors.grey.shade600,
    "grey.shade700": Colors.grey.shade700,
    "grey.shade800": Colors.grey.shade800,
    "grey.shade900": Colors.grey.shade900,
  };

  static Color get(String val) {
    if (val == '') return Colors.black;

    if (COLOR_MAP.containsKey(val)) {
      return COLOR_MAP[val];
    }

    return Colors.black;
  }
}
