import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/widgets/themedata.dart';
import 'package:flutter_calculator/bloc/inoutdisplay_bloc.dart';

class InOutDisplayTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InOutDisplayBloc, CalculatorCurrentState>(
      builder: (context, CalculatorCurrentState currentstate) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: InputTextView(inputs: currentstate.inputs),
            ),
            Expanded(
                flex: 1,
                child: OutputTextView(
                  text: currentstate.outputText,
                ))
          ],
        );
      },
    );
  }
}

class OutputTextView extends StatelessWidget {
  final String text;

  const OutputTextView({this.text});

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
