import 'package:flutter/material.dart';
import 'package:rikiki_for_real/core/constants/button_sizes.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final ButtonSizes size;
  const MyButton(
      {required this.title, this.onPressed, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: size.fontSize),
          padding: EdgeInsets.all(size.padding),
          minimumSize: size.minimumSize),
      child: Text(title),
    );
  }
}
