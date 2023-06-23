import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/main_page.dart';
import 'package:my_app/pages/page_builder.dart';
import 'package:my_app/providers/page_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PageProvider(),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.red,
            ),
          ),
          home: const PageBuilder("new_signup_page"),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Padding(
              padding: EdgeInsets.all(10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurple[200]),
                    child: Icon(
                      Icons.account_tree_outlined,
                      size: 30,
                      color: Colors.deepPurple[400],
                    )),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Hi Suhas",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey[800]),
                              ),
                            ),
                            Text(
                              "Welcome to smart bachaat",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.notifications_outlined)))
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          Container(
            child: Stack(
              children: [
                Container(
                    height: 150,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.grey[200],
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.grey[200],
                        ))
                      ],
                    )),
                Container(
                  height: 150,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(2.0, 2.0),
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                                spreadRadius: 1)
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.grey.shade200, Colors.deepPurple.shade100]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
