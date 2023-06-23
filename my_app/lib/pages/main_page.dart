import "package:flutter/material.dart";
import "package:my_app/bottom_bar.dart";
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _LoaderState();
}

class _LoaderState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedBottomBar(
        currentIcon: 0,
        onTap: (some) => {},
        icons: [
          Icons.home_outlined,
          Icons.wallet_outlined,
          Icons.search,
          Icons.settings_outlined
        ],
      ),
      body: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Colors.deepPurple.shade400,
          size: 50,
        ),
      ),
    );
  }
}

class _MainPageState extends State<MainPage> {
  void iampressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedBottomBar(
        currentIcon: 0,
        onTap: (some) => {},
        icons: [
          Icons.home_outlined,
          Icons.wallet_outlined,
          Icons.search,
          Icons.settings_outlined
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.wallet),
      //       label: "dashboard",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: "settings",
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.deepPurple.shade50,
                      Colors.deepPurple.shade100,
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "My",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  fontFamily: "Comme"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Bachaat",
                              style:
                                  TextStyle(fontSize: 35, fontFamily: "Jost"),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.grey[750],
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      //color: Colors.deepPurple.shade300,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.deepPurple.shade200,
                          Colors.deepPurple.shade400,
                        ],
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //       offset: Offset(1.0, 1.0),
                      //       color: Colors.grey.shade600,
                      //       blurRadius: 1,
                      //       spreadRadius: 1),
                      // ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.deepPurple.shade500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create a new bachaat gaat and invite members to join",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white60),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: iampressed,
                            child: Text(
                              "Create",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 10),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Join top bachat gaats in your area",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade400.withOpacity(0.3),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                child: Icon(Icons.search_outlined),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 18),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.deepPurple.shade100,
                                    Colors.deepPurple.shade400
                                  ],
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15, left: 15),
                                  child: Container(
                                    width: 200,
                                    height: 40,
                                    child: Text(
                                      "Radhai Mahila Bachaat Gaat",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Row(children: [
                                    Text(
                                      "Premium of ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "₹1000",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[200],
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                        color: Colors.deepPurple.shade400,
                                      ),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.deepPurple.shade300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Text(
                                        "10 members are part of this bachaat gaat",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.deepPurple.shade100,
                                    Colors.deepPurple.shade400
                                  ],
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15, left: 15),
                                  child: Container(
                                    width: 200,
                                    height: 40,
                                    child: Text(
                                      "Wamandada Kardak Nagar - Bachaat Gaat",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Row(children: [
                                    Text(
                                      "Premium of ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700]),
                                    ),
                                    Text(
                                      "₹5000",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[200],
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                        color: Colors.deepPurple.shade400,
                                      ),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.deepPurple.shade300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Text(
                                        "5 members are part of this bachaat gaat",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
