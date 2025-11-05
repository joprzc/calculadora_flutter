import 'dart:async';
import 'dart:math';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {

    //Registra el metodo privado como manejador del evento
    on<ResetAC>(_onResetAC);  //borrar todo
    on<AddNumber>(_onAddNumber);  //agregar numeros
    on<DeleteLastEntry>(_onDeleteLastEntry); // borrar con del
    on<OperationEntry>(_onOperationEntry);  // agregar operacion
    on<CalculateResult>(_onCalculateResult);
    // otros...
   
  }

  //Metodo async para agregar calculos o llamadas a servicios,
  Future<void> _onResetAC(ResetAC event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(
      firsNumber: '0',
      mathResult: '0',
      secondNumber: '0',
      operation: '',
    ));
  }

  Future<void> _onAddNumber(AddNumber event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(
      mathResult: (state.mathResult == '0')
          ? event.number
          : state.mathResult + event.number,
    ));
  }

  Future<void> _onDeleteLastEntry(DeleteLastEntry event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(
      mathResult: (state.mathResult.length > 1)
                    ? state.mathResult.substring(0, state.mathResult.length - 1)
                    : '0'
    ));
  }

  Future<void> _onOperationEntry(OperationEntry event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(
      firsNumber: state.mathResult,
      mathResult: '0',
      operation: event.operation,
      secondNumber: '0',
    ));
  }

  // calcular resultado
  Future<void> _onCalculateResult(CalculateResult event, Emitter<CalculatorState> emit) async {
    
    final double num1 = double.tryParse(state.firsNumber) ?? 0;
    final double num2 = double.tryParse(state.mathResult) ?? 0;
    double result = 0;

    switch (state.operation) {
      case '+':
        emit (state.copyWith(
          secondNumber: state.mathResult,
          mathResult: '${num1 + num2}'
        ));
        break;
      case 'sin()':
        // convertimos a radianes
        final double radianes = num1 * (pi/180);
        final double result = sin(radianes);

        print('RADIANES:  $radianes, RESULTADO: $result');

        emit(state.copyWith(
          secondNumber: '',
          mathResult: result.toStringAsExponential(6),  // mas presicion          
        ));
        break;
      
      default:
      emit(state);  // por si no hay conincidencias
      print('Operation: ${state.operation}, num1: $num1, num2: $num2, result: $result');
    }

    // emit (state.copyWith(
      
      
      
    // ));
  }
  // otros...

}
