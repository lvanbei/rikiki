import 'dart:ui';

enum ButtonSizes { small, medium, big }

extension ButtonSizeEx on ButtonSizes {
  Size get minimumSize {
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

  double get padding {
    switch (this) {
      case ButtonSizes.small:
        return 16;
      case ButtonSizes.medium:
        return 24;
      case ButtonSizes.big:
        return 32;
      default:
        return 8;
    }
  }

  double get fontSize {
    switch (this) {
      case ButtonSizes.small:
        return 24;
      case ButtonSizes.medium:
        return 30;
      case ButtonSizes.big:
        return 36;
      default:
        return 12;
    }
  }
}
