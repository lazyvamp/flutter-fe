import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_app/actions/executor.dart';
import 'package:my_app/models/actions.dart' as action_model;
import 'package:my_app/pages/page_builder.dart';
import 'package:my_app/widgets/base.dart';
import 'package:my_app/widgets/factory.dart';

class ElevatedButtonWidget extends StatefulWidget {
  action_model.Action? action;
  List<dynamic>? padding = List.empty();
  Widget child;
  String type;
  VoidCallback onPressed;

  ElevatedButtonWidget(this.type, this.child,
      {super.key, this.padding, this.action, VoidCallback? onPressed})
      : onPressed = onPressed ?? (() {});

  @override
  State<ElevatedButtonWidget> createState() {
    if (type == "CIRCULAR") {
      return _CircularButtonWidgetState();
    }
    return _ElevatedButtonWidgetState();
  }

  factory ElevatedButtonWidget.fromJson(Map<String, dynamic> map) {
    var childJson = map['child'];

    Widget child = WidgetFactory.getWidget(childJson['widget'], childJson);
    action_model.Action? action;

    if (map['action'] != null) {
      action = action_model.Action.fromJson(map['action']);
    }

    return ElevatedButtonWidget(
      map['type'] ?? "default",
      child,
      action: action,
      padding: map['padding'],
    );
  }
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: getStyle(context),
      onPressed: () {
        handleButtonPress(context);
      },
      child: getChild(context),
    );
  }

  getStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      minimumSize: const Size.fromHeight(40), // NEW
    );
  }

  Widget getLoader(BuildContext context) {
    return LoadingAnimationWidget.prograssiveDots(
        color: Colors.deepPurple.shade400, size: 30);
  }

  getChild(BuildContext context) {
    if (isLoading) {
      return getLoader(context);
    }

    return widget.child;
  }

  handleButtonPress(BuildContext context) {
    widget.onPressed();
    if (widget.action != null) {
      setState(() {
        isLoading = true;
      });
      ActionExecutor.execute(widget.action!);
    }
  }
}

class _CircularButtonWidgetState extends _ElevatedButtonWidgetState {
  @override
  getStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(10),
      // Button color
      backgroundColor: Colors.deepPurple,
      // Splash color
      foregroundColor: Colors.deepPurple.shade100,
    );
  }

  @override
  Widget getLoader(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
        color: Colors.white, size: 20);
  }
}
