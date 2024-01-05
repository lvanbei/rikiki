import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final TextStyle textStyle;

  /// Display a custom right icon
  final Widget? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Action to trigger when right button is long pressed
  final Function()? rightButtonLongPressFn;

  /// Display a custom left icon
  final Widget? leftIcon;

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
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
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
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1', widget.enableOne),
              _calcButton('2', widget.enableTwo),
              _calcButton('3', widget.enableThree),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4', widget.enableFor),
              _calcButton('5', widget.enableFive),
              _calcButton('6', widget.enableSix),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7', widget.enableSeven),
              _calcButton('8', widget.enableEight),
              _calcButton('9', widget.enableNine),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: widget.leftIcon)),
              _calcButton('0', widget.enableZero),
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.rightButtonFn,
                  onLongPress: widget.rightButtonLongPressFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: widget.rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value, bool isEnabled) {
    return ElevatedButton(
        onPressed: isEnabled
            ? () {
                widget.onKeyboardTap(value);
              }
            : null,
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: widget.textStyle,
          ),
        ));
  }
}
