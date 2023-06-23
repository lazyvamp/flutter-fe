import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/widgets/base.dart';

class FlexContainerWidget extends BaseStateLessWidget {
  int? flex;
  Widget child;

  FlexContainerWidget(this.child, {super.key, this.flex});

  @override
  Widget buildWidget(BuildContext context) {
    Container container = Container(child: child);

    if (flex != null) {
      return Flexible(child: container);
    }

    return container;
  }
}
