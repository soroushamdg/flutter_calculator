import 'package:flutter/material.dart';
import 'package:flutter_calculator/bloc/inoutdisplay_bloc.dart';
import 'package:flutter_calculator/bloc/thememodes_bloc.dart';
import 'package:flutter_calculator/widgets/keypad_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeypadViewDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeMode>(
        builder: (context, ThemeMode thememode) {
      return Container(
        decoration: BoxDecoration(
          color: (thememode == ThemeMode.light)
              ? Color(0xfff2f2f2)
              : Color(0xFF22252D),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        child: KeypadViewGrid(darkmode: !(thememode == ThemeMode.light)),
      );
    });
  }
}

class KeypadViewGrid extends StatelessWidget {
  final bool darkmode;

  KeypadViewGrid({this.darkmode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeypadButton(
                labelColor: Color(0xff26D9BA),
                darkTheme: darkmode,
                label: 'AC',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: 'AC', eventMode: KeypadEvents.clear));
                },
              ),
              KeypadButton(
                labelColor: Color(0xff26D9BA),
                darkTheme: darkmode,
                label: '±',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '±', eventMode: KeypadEvents.operators));
                },
              ),
              KeypadButton(
                labelColor: Color(0xff26D9BA),
                darkTheme: darkmode,
                label: '%',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '%', eventMode: KeypadEvents.operators));
                },
              ),
              KeypadButton(
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '÷',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '/', eventMode: KeypadEvents.operators));
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeypadButton(
                darkTheme: darkmode,
                label: '7',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '7', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '8',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '8', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '9',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '9', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '×',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '*', eventMode: KeypadEvents.operators));
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeypadButton(
                border: true,
                width: 20.0,
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '(',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '(', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '4',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '4', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '5',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '5', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '6',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '6', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '-',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '-', eventMode: KeypadEvents.operators));
                },
              ),
              KeypadButton(
                border: true,
                width: 20.0,
                darkTheme: darkmode,
                labelColor: Color(0xffF37B7B),
                label: ')',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: ')', eventMode: KeypadEvents.number));
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeypadButton(
                darkTheme: darkmode,
                label: '1',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '1', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '2',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '2', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '3',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '3', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '+',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '+', eventMode: KeypadEvents.operators));
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KeypadButton(
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '<',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: 'bs', eventMode: KeypadEvents.backspace));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '0',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '0', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                darkTheme: darkmode,
                label: '.',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '.', eventMode: KeypadEvents.number));
                },
              ),
              KeypadButton(
                labelColor: Color(0xffF37B7B),
                darkTheme: darkmode,
                label: '=',
                onPressed: () {
                  context.read<InOutDisplayBloc>().add(KeypadEventState(
                      clickedLabel: '=', eventMode: KeypadEvents.calculate));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
