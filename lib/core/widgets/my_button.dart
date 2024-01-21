import 'package:flutter/material.dart';
import 'package:rikiki_for_real/core/constants/button_sizes.dart';

class MyButton extends StatelessWidget {
  final Function? onPressed;
  final String title;
  final ButtonSizes size;
  const MyButton(
      {required this.title, this.onPressed, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed == null
          ? null
          : () {
              onPressed!();
            },
      style: ElevatedButton.styleFrom(
          textStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: size.fontSize),
          padding: EdgeInsets.all(size.padding),
          minimumSize: size.minimumSize),
      child: Text(title),
    );
  }
}
