import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/themedata.dart';
import 'package:flutter_calculator/bloc/inoutdisplay_bloc.dart';

class InOutDisplayTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ResultOutputTextView extends StatelessWidget {
  final String text;

  const ResultOutputTextView({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30.0),
    );
  }
}

class InputTextView extends StatelessWidget {
  final List<String> inputs;

  InputTextView({this.inputs});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: inputs.map((input) {
        if (operators.contains(input)) {
          return TextSpan(text: input, style: inputOperatorsTextStyle);
        } else {
          return TextSpan(text: input);
        }
      }).toList()),
    );
  }
}
