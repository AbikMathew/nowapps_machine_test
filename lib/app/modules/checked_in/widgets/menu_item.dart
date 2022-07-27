import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  CustomMenuItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 35,
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}