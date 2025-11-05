part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;
  AddNumber(this.number);
}

// boton del
class DeleteLastEntry extends CalculatorEvent {}

//para realizar operaciones
class OperationEntry extends CalculatorEvent {
  final String operation;
  OperationEntry(this.operation);
}

// calcular resultado
class CalculateResult extends CalculatorEvent {}
