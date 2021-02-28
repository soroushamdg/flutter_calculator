import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/widgets/themedata.dart';
import 'package:flutter_calculator/bloc/inoutdisplay_bloc.dart';

Map<String, String> operatorsSymbols = {
  '*': '×',
  '/': '÷',
  '+': '+',
  '-': '-',
  '%': '%'
};

class InOutDisplayTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InOutDisplayBloc, CalculatorCurrentState>(
      builder: (context, CalculatorCurrentState currentstate) {
        print('building inout display with ${currentstate.inputs}');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: InputTextView(
                    inputs: (currentstate.inputs?.isNotEmpty ?? false)
                        ? currentstate.inputs
                        : ['0']),
              ),
              Flexible(
                  flex: 1,
                  child: OutputTextView(
                    text: (currentstate.outputText?.isNotEmpty ?? false)
                        ? currentstate.outputText
                        : '0',
                  ))
            ],
          ),
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
      maxLines: 1,
      style: TextStyle(
        fontSize: 60.0,
      ),
      textAlign: TextAlign.right,
    );
  }
}

class InputTextView extends StatelessWidget {
  final List<String> inputs;

  InputTextView({this.inputs});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
          style: TextStyle(
            fontSize: 30.0,
            color: Color(0xFF797979),
            wordSpacing: 1.0,
          ),
          children: inputs.map((input) {
            if (operators.contains(input)) {
              return TextSpan(
                  text: operatorsSymbols[input].padLeft(2).padRight(3),
                  style: inputOperatorsTextStyle);
            } else {
              return TextSpan(text: input);
            }
          }).toList()),
    );
  }
}
