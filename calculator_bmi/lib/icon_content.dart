import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.ikon, required this.label});

  final IconData ikon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ikon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18.0, color: Colors.white10),
        )
      ],
    );
  }
}