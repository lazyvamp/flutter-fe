import 'package:flutter/material.dart';
import 'package:my_app/pages/icons.dart';
import 'package:my_app/widgets/button.dart';
import 'package:my_app/widgets/column_container.dart';
import 'package:my_app/widgets/form.dart';
import 'package:my_app/widgets/header.dart';
import 'package:my_app/widgets/text.dart';

class WidgetFactory {
  static Widget getWidget(String widgetName, Map<String, dynamic> map) {
    switch (widgetName) {
      case "HEADER":
        return HeaderWidget.fromJson(map);
      case "STATIC_TEXT":
        return StaticTextWidget.fromJson(map);
      case "COLUMN_CONTAINER":
        return ColumnContainerWidget.fromJson(map);
      case "ELEVATED_BUTTON":
        return ElevatedButtonWidget.fromJson(map);
      case "SINGLE_FIELD_FORM":
        return SingleFieldFormWidget.fromJson(map);
      case "MATERIAL_ICON":
        return MaterialIconWidget.fromJson(map);
      default:
        throw "invalid widget $widgetName";
    }
  }
}
