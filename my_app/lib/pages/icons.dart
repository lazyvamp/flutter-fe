import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/utils/common.dart';
import 'package:my_app/widgets/base.dart';

class MaterialIconWidget extends BaseStateLessWidget {
  final IconData iconData;
  final Color color;
  final double size;

  MaterialIconWidget(this.iconData, this.color, this.size);

  @override
  Widget buildWidget(BuildContext context) {
    return Icon(iconData, color: color, size: size);
  }

  factory MaterialIconWidget.fromJson(Map<String, dynamic> json) {
    IconData? iconData = IconUtils.getIcon(json['icon']);
    var color = ColorUtils.get(json['color']);

    return MaterialIconWidget(iconData!, color, json['size']);
  }
}
