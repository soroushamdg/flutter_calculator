import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/input_output_display.dart';
import 'package:flutter_calculator/widgets/keypad.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          flex: 1,
          child: InOutDisplayTextView(),
        ),
        Expanded(
          flex: 2,
          child: KeypadViewDisplay(),
        ),
      ],
    ));
  }
}
