part of 'calculator_bloc.dart';


class CalculatorState {

  final String mathResult;
  final String firsNumber;
  final String secondNumber;  
  final String operation;

  CalculatorState({
    this.mathResult = '30',
    this.firsNumber = '10',
    this.secondNumber = '20',
    this.operation = '+',
    });  
  
  // realizar copias del estado de la calculadora
  CalculatorState copyWith({
    String? mathResult,
    String? firsNumber,
    String? secondNumber,  
    String? operation,
  }) => CalculatorState(
    mathResult  : mathResult ?? this.mathResult,  // si viene un valor nulo toma el valor inicial
    firsNumber  : firsNumber ?? this.firsNumber,
    secondNumber: secondNumber ?? this.secondNumber,  
    operation   : operation ?? this.operation,
  );
}


