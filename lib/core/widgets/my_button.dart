import 'package:flutter/material.dart';
import 'package:rikiki/core/constants/button_sizes.dart';

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
        textStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: size.fontSize),
        padding: size.padding,
        minimumSize: size.fixedSize,
        alignment: Alignment.center,
      ),
      child: Text(title),
    );
  }
}
