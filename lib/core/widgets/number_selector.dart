import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'label.dart';

class NumberSelector extends StatelessWidget {
  final String labelText;
  final String number;
  final Function()? onMinPress;
  final Function()? onPlusPress;
  final bool readOnly;

  const NumberSelector({
    this.labelText = '',
    required this.number,
    this.onMinPress,
    this.onPlusPress,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Label(text: labelText),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                  onPressed: readOnly ? null : onMinPress,
                  icon: const Icon(Icons.minimize)),
              Text(
                number,
                style: TextStyle(
                    fontSize: 24, color: readOnly ? AppColors.lightGrey : null),
              ),
              IconButton(
                onPressed: readOnly ? null : onPlusPress,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
