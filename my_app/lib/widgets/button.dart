import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_app/actions/executor.dart';
import 'package:my_app/models/actions.dart' as action_model;
import 'package:my_app/widgets/factory.dart';

class ElevatedButtonWidget extends StatefulWidget {
  String type;
  dynamic Function() preProcessor;
  dynamic Function() postProcessor;
  Map<String, dynamic> params;

  ElevatedButtonWidget(this.params, this.type,
      {super.key,
      dynamic Function()? preProcessor,
      dynamic Function()? postProcessor})
      : preProcessor = preProcessor ?? (() {}),
        postProcessor = postProcessor ?? (() {});

  @override
  State<ElevatedButtonWidget> createState() {
    if (type == "CIRCULAR") {
      return _CircularButtonWidgetState();
    }
    return _ElevatedButtonWidgetState();
  }

  factory ElevatedButtonWidget.fromJson(Map<String, dynamic> map) {
    return ElevatedButtonWidget(map, map['type'] ?? "default",
        preProcessor: map['preProcessor']);
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

    var childJson = widget.params['child'];
    return WidgetFactory.getWidget(childJson['widget'], childJson);
  }

  handleButtonPress(BuildContext context) {
    var x = widget.preProcessor();
    print(x);

    if (widget.params['action'] != null) {
      setState(() {
        isLoading = true;
      });
      action_model.Action action =
          action_model.Action.fromJson(widget.params['action']);
      ActionExecutor.execute(action, data: x);
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
