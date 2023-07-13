import "dart:developer";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:my_app/providers/page_provider.dart";
import "package:my_app/widgets/factory.dart";
import "package:provider/provider.dart";
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageBuilder extends StatefulWidget {
  final String page;

  const PageBuilder(this.page, {super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  void initState() {
    final provider = Provider.of<PageProvider>(context, listen: false);
    print("page fetch is happening here for page: " + widget.page);
    provider.fetchPage(widget.page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('build called for page: ' + widget.page);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: render(context),
    );
  }

  Widget render(BuildContext context) {
    final provider = Provider.of<PageProvider>(context);
    print("is loading " + provider.isLoading.toString());
    if (provider.isLoading) {
      return loadingUI();
    }
    print("printing body--------------------");
    print(provider.body);
    //return pageUI();
    return dynamicPageUI(provider.body);
  }

  Widget loadingUI() {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: Colors.deepPurple.shade400,
        size: 50,
      ),
    );
  }

  Widget dynamicPageUI(Map<String, dynamic> map) {
    print(map);
    var children = List<Widget>.from(map['data']["widgets"]
        .map((x) => WidgetFactory.getWidget(x['widget'], x)));

    // children.add(
    //   Padding(
    //     padding: EdgeInsets.only(left: 20, right: 40, bottom: 600),
    //     child: Container(
    //       child: Row(
    //         children: [
    //           Flexible(
    //             child: Padding(
    //               padding: EdgeInsets.only(right: 20),
    //               child: TextFormField(
    //                 cursorColor: Color.fromARGB(255, 12, 186, 58),
    //                 keyboardType: TextInputType.number,
    //                 validator: null,
    //                 autofocus: true,
    //                 style: TextStyle(
    //                     fontSize: 20,
    //                     letterSpacing: 3,
    //                     fontWeight: FontWeight.bold,
    //                     color: Color.fromARGB(255, 69, 38, 122)),
    //                 decoration: const InputDecoration(
    //                   isDense: true,
    //                   contentPadding: EdgeInsets.all(0.0),
    //                   suffixIcon: null,
    //                   border: UnderlineInputBorder(
    //                     borderSide: BorderSide(
    //                         color: Color.fromARGB(255, 132, 104, 181)),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             width: 50,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {},
    //             // icon of the button
    //             child: LoadingAnimationWidget.threeArchedCircle(
    //               color: Colors.white,
    //               size: 20,
    //             ),
    //             // styling the button
    //             style: ElevatedButton.styleFrom(
    //               shape: CircleBorder(),
    //               padding: EdgeInsets.all(10),
    //               // Button color
    //               backgroundColor: Colors.deepPurple,
    //               // Splash color
    //               foregroundColor: Colors.deepPurple.shade100,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 214, 202, 237),
                  Color.fromARGB(255, 214, 202, 237),
                ],
              ),
            ),
          ),
          Column(
            children: children,
          )
        ],
      ),
    );
  }

  Widget pageUI() {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 214, 202, 237),
                  Color.fromARGB(255, 214, 202, 237),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                //color: Colors.white,
              ),
              Flexible(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  child: Column(children: [
                    Text(
                      "my BACHAAT",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text("The simplest way to start saving")
                  ]),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "ACCOUNT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text(
                          "Login/Create account to start saving",
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              minimumSize: const Size.fromHeight(40), // NEW
                            ),
                            onPressed: () {},
                            child: LoadingAnimationWidget.waveDots(
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        Text(
                          "By clicking, I accept the Terms & Conditions and Privacy Policy",
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
