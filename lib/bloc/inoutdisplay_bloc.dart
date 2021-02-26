import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';

const operators = ['+', '*', '/', '-', '%'];

enum KeypadEvents { number, operators, clear, calculate }

class KeypadEventState {
  final KeypadEvents eventMode;
  final String clickedLabel;

  KeypadEventState({this.eventMode, this.clickedLabel});
}

class CalculatorCurrentState {
  List<String> _inputs = [];
  List<String> get inputs => _inputs;
  String get strinputs => inputs.join();

  String _calculatedResult;
  String get calculatedResult => _calculatedResult;

  String _outputText;
  String get outputText => _outputText;

  void calculate() {
    if (!cancalculate()) {
      return;
    }
    Parser p = new Parser();
    Expression exp = p.parse(inputs.join());
    _calculatedResult = exp.evaluate(EvaluationType.REAL, null).toString();
    _outputText = calculatedResult;
  }

  bool cancalculate() {
    if (!operators.contains(inputs.last) && inputs.isNotEmpty) {
      return true;
    }
    return false;
  }

  void appendnumber(String number) {
    if (inputs.isEmpty) {
      inputs.add(number);
    } else if (operators.contains(inputs.last)) {
      inputs.add(number);
    } else {
      inputs.last += number;
    }
    _outputText = inputs.last;
  }

  void appendoperator(String op) {
    if (inputs.isEmpty) {
      return;
    }
    if (operators.contains(inputs.last)) {
      inputs.removeLast();
      inputs.add(op);
      return;
    }
    inputs.add(op);
    return;
  }
}

class InOutDisplayBloc extends Bloc<KeypadEventState, CalculatorCurrentState> {
  InOutDisplayBloc() : super(CalculatorCurrentState());

  @override
  Stream<CalculatorCurrentState> mapEventToState(
      KeypadEventState event) async* {
    CalculatorCurrentState _current = state;
    switch (event.eventMode) {
      case (KeypadEvents.clear):
        yield CalculatorCurrentState();
        break;
      case (KeypadEvents.number):
        _current.appendnumber(event.clickedLabel);
        yield _current;
        break;
      case (KeypadEvents.operators):
        _current.appendoperator(event.clickedLabel);
        yield _current;
        break;
      case (KeypadEvents.calculate):
        _current.calculate();
        yield _current;
        break;
      default:
        yield CalculatorCurrentState();
        break;
    }
  }
}
