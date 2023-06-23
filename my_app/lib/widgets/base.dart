import 'package:flutter/material.dart';

abstract class BaseStateLessWidget extends StatelessWidget {
  List<dynamic>? padding = List.empty();

  BaseStateLessWidget({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    Widget widget = buildWidget(context);

    if (padding != null) {
      widget = Padding(
          padding: EdgeInsets.only(
            left: (padding![0]).toDouble(),
            right: (padding![1]).toDouble(),
            top: (padding![2]).toDouble(),
            bottom: (padding![3]).toDouble(),
          ),
          child: widget);
    }

    return widget;
  }

  Widget buildWidget(BuildContext context);
}
