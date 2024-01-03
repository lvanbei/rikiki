import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  const BigButton({required this.title, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 36),
          padding: const EdgeInsets.all(32),
          minimumSize: const Size(300, 100)),
      child: Text(title),
    );
  }
}
