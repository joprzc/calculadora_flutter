import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {

    //Registra el metodo privado como manejador del evento
    on<ResetAC>(_onResetAC);
    on<AddNumber>(_onAddNumber);
    // otros...

  //   // manejador para el evento ResetAC
  //   on<ResetAC>((event, emit) {
  //     emit(CalculatorState(
  //       firsNumber: '0',
  //       mathResult: '0',
  //       secondNumber: '0',
  //       operation: 'none',
  //     ));
  //   });

  //   // evento para agregar numeros
  //   on<AddNumber>((event, emit) {
  //     emit(state.copyWith(
  //       mathResult: (state.mathResult == '0')
  //           ? event.number
  //           : state.mathResult + event.number,
  //     ));
  //   });
  // }
   
  }

  //Metodo async para agregar calculos o llamadas a servicios,
  Future<void> _onResetAC(ResetAC event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(
      firsNumber: '0',
      mathResult: '0',
      secondNumber: '0',
      operation: 'none',
    ));
  }

  Future<void> _onAddNumber(AddNumber event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(
      mathResult: (state.mathResult == '0')
          ? event.number
          : state.mathResult + event.number,
    ));
  }
  // otros...

}
