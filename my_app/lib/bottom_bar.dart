import "package:flutter/material.dart";

class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<IconData> icons;
  final ValueChanged<int>? onTap;
  const AnimatedBottomBar({
    Key? key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              child: Image.asset(
                "lib/assets/icons/home.png",
                color: Colors.deepPurple,
              ),
            ),
            Container(
              height: 35,
              //color: Colors.red,
              child: Image.asset(
                "lib/assets/icons/dashboard.png",
              ),
            ),
            Container(
              height: 35,
              //color: Colors.red,
              child: Image.asset(
                "lib/assets/icons/magnifying-glass.png",
              ),
            ),
            Container(
              height: 32,
              //color: Colors.red,
              child: Image.asset(
                "lib/assets/icons/user.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
