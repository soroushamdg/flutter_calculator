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
  List<String> get inputs => _inputs ?? ['Type...'];
  String get strinputs => inputs.join();

  String _calculatedResult;
  String get calculatedResult => _calculatedResult;

  String _outputText;
  String get outputText {
    if (_outputText != null) {
      return (_outputText.length > 10) ? 'overflow 🧨' : _outputText;
    } else {
      return '0';
    }
  }

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
    if (!operators.contains(inputs.last) &&
        inputs.isNotEmpty &&
        '('.allMatches(strinputs).length == ')'.allMatches(strinputs).length) {
      return true;
    }
    return false;
  }

  void appendnumber(String number) {
    if (inputs.isEmpty || operators.contains(inputs.last)) {
      inputs.add(number);
    } else if (inputs.last.length < 8) {
      inputs.last += number;
    }
    _outputText = inputs.last;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  void appendoperator(String op) {
    if (inputs.isEmpty) {
      return;
    }
    if (operators.contains(inputs.last)) {
      calculate();
      inputs.removeLast();
      inputs.add(op);
      return;
    }
    if (op == '±' && isNumeric(inputs.last)) {
      _inputs.last = '-' + inputs.last;
      calculate();
      return;
    }
    calculate();
    inputs.add(op);
    return;
  }

  CalculatorCurrentState();

  CalculatorCurrentState.fromJson(Map<String, dynamic> jsonObject) {
    this._calculatedResult = jsonObject['_calculatedResult'];
    this._inputs = jsonObject['_inputs'];
    this._outputText = jsonObject['_outputText'];
  }
  CalculatorCurrentState retCopy() {
    return CalculatorCurrentState.fromJson({
      '_inputs': _inputs,
      '_outputText': _outputText,
      '_calculatedResult': _calculatedResult,
    });
  }
}

class InOutDisplayBloc extends Bloc<KeypadEventState, CalculatorCurrentState> {
  InOutDisplayBloc() : super(CalculatorCurrentState());

  @override
  Stream<CalculatorCurrentState> mapEventToState(
      KeypadEventState event) async* {
    CalculatorCurrentState _current = state.retCopy();
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
        break;
    }
  }
}
