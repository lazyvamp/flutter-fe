import 'package:flutter/material.dart';

class PaddingUtils {
  static Widget wrap(Widget widget, List<dynamic>? padding) {
    if (padding == null) {
      return widget;
    }

    return Padding(
      padding: EdgeInsets.only(
        left: (padding[0]).toDouble(),
        right: (padding[1]).toDouble(),
        top: (padding[2]).toDouble(),
        bottom: (padding[3]).toDouble(),
      ),
      child: widget,
    );
  }
}

class IconUtils {
  static var ICON_MAP = {
    "arrow_forward": Icons.arrow_forward,
    "arrow_backward": Icons.arrow_back
  };

  static IconData? getIcon(String icon) {
    if (ICON_MAP.containsKey(icon)) {
      return ICON_MAP[icon];
    }

    throw Exception("Icon not found: " + icon);
  }
}

class TextUtils {
  static Map MAGNITUDE_MAP = {"H1": 30.0, "H2": 24.0, "H3": 18.0};
  static double DEFAULT_FONT_SIZE = 12.0;

  static double getFontSizeFromMagnitude(String magnitude) {
    if (MAGNITUDE_MAP.containsKey(magnitude)) {
      return MAGNITUDE_MAP[magnitude].toDouble();
    }

    return DEFAULT_FONT_SIZE;
  }

  static FontWeight getFontWeightFromString(String name) {
    switch (name) {
      case "bold":
        return FontWeight.bold;
      case "normal":
        return FontWeight.normal;
    }

    return FontWeight.normal;
  }
}
