import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title,
      {super.key,
      this.onTap,
      this.color = Colors.black,
      this.activeColor = const Color.fromARGB(255, 192, 162, 162),
      this.isActive = false,
      this.isNotified = false,
      this.style = const TextStyle(fontWeight: FontWeight.bold)});
  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          isNotified
              ? Stack(children: <Widget>[
                  Icon(
                    icon,
                    size: 26,
                    color: isActive ? activeColor : activeColor.withOpacity(.4),
                  ),
                  const Positioned(
                    top: 5.0,
                    right: 0,
                    left: 8.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.brightness_1,
                          size: 10.0, color: Colors.red),
                    ),
                  )
                ])
              : Icon(
                  icon,
                  size: 30,
                  color: isActive ? activeColor : Colors.grey,
                ),
          Text(title,
              style: TextStyle(
                  fontSize: 11, color: isActive ? activeColor : Colors.grey)),
        ],
      ),
    );
  }
}
