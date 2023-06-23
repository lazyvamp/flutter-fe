import 'package:flutter/material.dart';
import 'package:my_app/pages/background_builder.dart';
import 'package:my_app/pages/error.dart';
import 'package:my_app/widgets/factory.dart';

class PageBuilderV2 extends StatelessWidget {
  final Map<String, dynamic> pageData;
  Map<String, dynamic>? meta;

  PageBuilderV2(this.pageData, {super.key}) {
    meta = pageData['meta'] ?? {};
  }

  @override
  Widget build(BuildContext context) {
    print("build called for page: ");
    try {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: render(context),
      );
    } catch (e) {
      return Scaffold(
        body: ErrorPage(),
      );
    }
  }

  Widget render(BuildContext context) {
    var children = List<Widget>.from(pageData["widgets"]
        .map((x) => WidgetFactory.getWidget(x['widget'], x)));

    List<Widget> stackChildren = [];

    if (meta != null && meta!['background'] != null) {
      var background = BackgroundBuilder(meta!['background'] ?? 'default');
      stackChildren.add(background);
    }

    stackChildren.add(Column(children: children));

    return SafeArea(child: Stack(children: stackChildren));
  }
}
