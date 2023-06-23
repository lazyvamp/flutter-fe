import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/utils/common.dart';
import 'package:my_app/widgets/base.dart';

class StaticTextWidget extends BaseStateLessWidget {
  final String text;
  TextStyle? textStyle;

  StaticTextWidget(this.text, {super.key, this.textStyle, super.padding});

  @override
  Widget buildWidget(BuildContext context) {
    return Text(text, style: textStyle);
  }

  factory StaticTextWidget.fromJson(Map<String, dynamic> map) {
    var text = map['text'];
    var style = map['style'];
    var color = '';

    if (style != null) {
      color = style['color'] ?? '';
    }

    var textStyle = TextStyle(
        fontSize: _getFontSize(style),
        fontWeight: _getFontWeight(style),
        color: ColorUtils.get(color));

    return StaticTextWidget(
      text,
      textStyle: textStyle,
      padding: map['padding'],
    );
  }

  static double _getFontSize(style) {
    if (style == null) {
      return 12;
    }
    if (style['size'] != null) {
      return style['size'].toDouble();
    }

    if (style['magnitude'] != null) {
      return TextUtils.getFontSizeFromMagnitude(style['magnitude']);
    }

    return 12;
  }

  static FontWeight _getFontWeight(style) {
    if (style == null || style['weight'] == null) {
      return FontWeight.normal;
    }

    return TextUtils.getFontWeightFromString(style['weight']);
  }
}
