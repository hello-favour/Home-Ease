import 'package:flutter/material.dart';

Widget buildColorCircle(Color color) {
  return Container(
    height: 36,
    width: 36,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey.shade300),
    ),
  );
}
