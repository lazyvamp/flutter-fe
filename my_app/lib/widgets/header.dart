import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      //color: Colors.white,
    );
  }

  factory HeaderWidget.fromJson(Map<String, dynamic> map) {
    return HeaderWidget();
  }
}
