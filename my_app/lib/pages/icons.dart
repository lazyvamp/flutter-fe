import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/utils/common.dart';
import 'package:my_app/widgets/base.dart';

class MaterialIconWidget extends BaseStateLessWidget {
  Map<String, dynamic> params;

  MaterialIconWidget(this.params, {super.key, super.padding});

  @override
  Widget buildWidget(BuildContext context) {
    var iconData = IconUtils.getIcon(params['icon']);
    var color = ColorUtils.get(params['color']);
    var size = params['size'].toDouble() ?? 20;

    return Icon(iconData, color: color, size: size);
  }

  factory MaterialIconWidget.fromJson(Map<String, dynamic> json) {
    return MaterialIconWidget(
      json,
      padding: json['padding'],
    );
  }
}
