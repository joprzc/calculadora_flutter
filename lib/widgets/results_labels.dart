import 'package:calculadora/bloc/calculator/calculator_bloc.dart';
import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {

        //Funcion auxiliar para formatear los numeros
        String formatNumber(String value){

          // convierte el valor a double
          final doubleVal = double.tryParse(value);
          if(doubleVal == null) return value;

          // si un numero entero, lo muestra sin decimales
          if (doubleVal % 1 == 0) {
            return doubleVal.toInt().toString();
          } else {
            // si tiene decimales, muestra maximo 6 decimales
            return doubleVal.toStringAsFixed(6).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
          }                   
        }

        if (state.firsNumber == '0' && state.secondNumber == '0') {
          return MainResultText(
            text: formatNumber(state.mathResult),
          );
        }

        return Column(
          children: [
            SubResult(text: formatNumber(state.firsNumber)),
            SubResult(text: state.operation),
            SubResult(text: formatNumber(state.secondNumber)),
            LineSeparator(),
            MainResultText(text: formatNumber(state.mathResult))
          ],
        );
        
        /**
        if (state.firsNumber == '0' && state.secondNumber == '0') {
          return MainResultText(
            text: state.mathResult.endsWith('.0')
                  ? state.mathResult.substring(0, state.mathResult.length - 2)
                  : state.mathResult
          );
        }
        
        return Column(
          children: [
            SubResult(text: state.firsNumber),
            SubResult(text: state.operation),
            SubResult(
              text: state.secondNumber.endsWith('.0')
                    ? state.secondNumber.substring(0,state.mathResult.length - 2)
                    : state.secondNumber
            ),
            LineSeparator(),
            MainResultText(
              text: state.mathResult.endsWith('.0')
                    ? state.mathResult.substring(0,state.mathResult.length - 2)
                    : state.mathResult
            ),
          ],
        );
        */
      },
    );
  }
}
