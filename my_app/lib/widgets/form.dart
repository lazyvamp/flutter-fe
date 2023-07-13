import 'package:flutter/material.dart';
import 'package:my_app/widgets/factory.dart';
import 'package:my_app/widgets/text_form_field.dart';

// Create a Form widget.
class SingleFieldFormWidget extends StatefulWidget {
  List<dynamic>? padding = List.empty();
  Map<String, dynamic> params;

  SingleFieldFormWidget(this.params, {super.key, this.padding});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }

  factory SingleFieldFormWidget.fromJson(Map<String, dynamic> json) {
    return SingleFieldFormWidget(
      json,
      padding: json['padding'],
    );
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<SingleFieldFormWidget> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> _formData = Map();

  updateFormData(String field, String? value) {
    print("form data has changed: $field ${value!}");
    _formData[field] = value;
  }

  Map<String, dynamic> getFormData() {
    return _formData;
  }

  @override
  Widget build(BuildContext context) {
    var field = CustomTextFormField(widget.params['field'], updateFormData);

    var buttonJson = widget.params['button'];
    buttonJson['preProcessor'] = getFormData;
    var button = WidgetFactory.getWidget(buttonJson['widget'], buttonJson);

    Widget container = Container(
        //color: Colors.red,
        child: Row(
      children: [Flexible(child: field), SizedBox(width: 130), button],
    ));

    if (widget.padding != null) {
      return Padding(
        padding: EdgeInsets.only(
          left: (widget.padding![0]).toDouble(),
          right: (widget.padding![1]).toDouble(),
          top: (widget.padding![2]).toDouble(),
          bottom: (widget.padding![3]).toDouble(),
        ),
        child: container,
      );
    }
    return container;
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       TextFormField(
    //         // The validator receives the text that the user has entered.
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter some text';
    //           }
    //           return null;
    //         },
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 16),
    //         child: ElevatedButton(
    //           onPressed: () {
    //             // Validate returns true if the form is valid, or false otherwise.
    //             if (_formKey.currentState!.validate()) {
    //               // If the form is valid, display a snackbar. In the real world,
    //               // you'd often call a server or save the information in a database.
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 const SnackBar(content: Text('Processing Data')),
    //               );
    //             }
    //           },
    //           child: const Text('Submit'),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
