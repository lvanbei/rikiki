import 'package:flutter/material.dart';

enum ButtonSizes { small, medium, big }

extension ButtonSizeEx on ButtonSizes {
  Size get fixedSize {
    switch (this) {
      case ButtonSizes.small:
        return const Size(150, 20);
      case ButtonSizes.medium:
        return const Size(225, 75);
      case ButtonSizes.big:
        return const Size(300, 100);
      default:
        return const Size(100, 100);
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ButtonSizes.small:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case ButtonSizes.medium:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
      case ButtonSizes.big:
        return const EdgeInsets.symmetric(horizontal: 48, vertical: 24);
      default:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  double get fontSize {
    switch (this) {
      case ButtonSizes.small:
        return 24;
      case ButtonSizes.medium:
        return 26;
      case ButtonSizes.big:
        return 32;
      default:
        return 12;
    }
  }
}
