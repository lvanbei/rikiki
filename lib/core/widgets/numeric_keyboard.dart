import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatelessWidget {
  /// Color of the text [default = Colors.black]
  final TextStyle textStyle;

  /// Display a custom right icon
  final Widget rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Action to trigger when right button is long pressed
  final Function()? rightButtonLongPressFn;

  /// Display a custom left icon
  final Widget leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  final bool enableZero;
  final bool enableOne;
  final bool enableTwo;
  final bool enableThree;
  final bool enableFor;
  final bool enableFive;
  final bool enableSix;
  final bool enableSeven;
  final bool enableEight;
  final bool enableNine;

  const NumericKeyboard({
    super.key,
    required this.onKeyboardTap,
    this.textStyle = const TextStyle(color: Colors.black),
    this.rightButtonFn,
    this.rightButtonLongPressFn,
    required this.rightIcon,
    this.leftButtonFn,
    required this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.enableZero = false,
    this.enableOne = false,
    this.enableTwo = false,
    this.enableThree = false,
    this.enableFor = false,
    this.enableFive = false,
    this.enableSix = false,
    this.enableSeven = false,
    this.enableEight = false,
    this.enableNine = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('1', enableOne),
              horizontalSpacing(),
              _calcButton('2', enableTwo),
              horizontalSpacing(),
              _calcButton('3', enableThree),
            ],
          ),
          verticalSpacing(),
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('4', enableFor),
              horizontalSpacing(),
              _calcButton('5', enableFive),
              horizontalSpacing(),
              _calcButton('6', enableSix),
            ],
          ),
          verticalSpacing(),
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('7', enableSeven),
              horizontalSpacing(),
              _calcButton('8', enableEight),
              horizontalSpacing(),
              _calcButton('9', enableNine),
            ],
          ),
          verticalSpacing(),
          Row(
            mainAxisAlignment: mainAxisAlignment,
            children: <Widget>[
              leftIcon,
              horizontalSpacing(),
              _calcButton('0', enableZero),
              horizontalSpacing(),
              rightIcon,
            ],
          ),
        ],
      ),
    );
  }

  SizedBox horizontalSpacing() {
    return const SizedBox(
      width: 8,
    );
  }

  SizedBox verticalSpacing() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget _calcButton(String value, bool isEnabled) {
    return ElevatedButton(
        onPressed: isEnabled
            ? () {
                onKeyboardTap(value);
              }
            : null,
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: textStyle,
          ),
        ));
  }
}
