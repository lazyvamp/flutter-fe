import 'package:flutter/material.dart';
import 'package:my_app/utils/colors.dart';
import 'package:my_app/widgets/base.dart';
import 'package:my_app/widgets/container.dart';
import 'package:my_app/widgets/factory.dart';

class ColumnContainerWidget extends BaseStateLessWidget {
  final List<Widget> children;
  BoxDecoration? decoration;
  int? flex;
  CrossAxisAlignment crossAxisAlignment;
  double? width;
  double? height;

  ColumnContainerWidget(
      {super.key,
      this.flex,
      required this.children,
      super.padding,
      this.decoration,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.height,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    Widget widget = super.build(context);

    widget = Container(
      child: widget,
      decoration: decoration,
      width: (width == null) ? double.infinity : width,
    );

    if (flex != null) {
      widget = Flexible(
        child: widget,
        flex: flex!,
      );
    }

    return widget;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: children,
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  @override
  factory ColumnContainerWidget.fromJson(Map<String, dynamic> map) {
    var children = List<Widget>.from(
        map["children"].map((x) => WidgetFactory.getWidget(x['widget'], x)));

    BoxDecoration? decoration = null;

    if (map['decoration'] != null) {
      decoration =
          BoxDecoration(color: ColorUtils.get(map['decoration']['color']));
    }

    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

    if (map['crossAxisAlignment'] != null) {
      crossAxisAlignment =
          CrossAxisAlignment.values.byName(map['crossAxisAlignment']);
    }

    return ColumnContainerWidget(
      flex: map['flex'],
      padding: map['padding'],
      children: children,
      decoration: decoration,
      crossAxisAlignment: crossAxisAlignment,
      width: map['width'],
    );
  }
}
