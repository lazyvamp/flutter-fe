import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends TextFormField {
  Map<String, dynamic> params;
  void Function(String, String?) callback;

  CustomTextFormField(params, this.callback, {super.key})
      : params = params ?? {},
        super(
            validator: _validator,
            onChanged: (value) => {callback(params['name'], value)},
            style: _getTextStyle(params['style'] ?? {}),
            decoration: _getDecoration(params['decoration'] ?? {}),
            keyboardType: _getTextInputType(params['keyboard']),
            autofocus: params['focus'] ?? false);

  static TextInputType _getTextInputType(param) {
    if (param == null) return TextInputType.text;

    switch (param) {
      case "number":
        return TextInputType.number;
    }

    return TextInputType.text;
  }

  static String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return "value should not be empty";
    }

    return null;
  }

  static _getTextStyle(Map<String, dynamic> params) {
    return const TextStyle(
      fontSize: 20,
      letterSpacing: 3,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 69, 38, 122),
    );
  }

  static _getDecoration(Map<String, dynamic> params) {
    return const InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(0.0),
      suffixIcon: null,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 132, 104, 181)),
      ),
    );
  }
}
