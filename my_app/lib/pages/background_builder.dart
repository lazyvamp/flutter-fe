import 'package:flutter/material.dart';

class BackgroundBuilder extends StatelessWidget {
  String backgroundType = 'default';

  BackgroundBuilder(this.backgroundType);

  @override
  Widget build(BuildContext context) {
    return buildDefaultBackground(context);
  }

  Widget buildDefaultBackground(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 214, 202, 237),
            Color.fromARGB(255, 214, 202, 237),
          ],
        ),
      ),
    );
  }
}
