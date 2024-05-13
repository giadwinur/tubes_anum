import 'package:function_tree/function_tree.dart';
import 'package:math_expressions/math_expressions.dart';

class BisectionResult {
  final List<Map<String, dynamic>> iterations;
  final double xApproximation;

  BisectionResult({required this.iterations, required this.xApproximation});
}

BisectionResult bisectionMethod(String equation, double guess1, double guess2, double error) {
  List<Map<String, dynamic>> iterations = [];
  int iter = 1;
  double a = guess1;
  double b = guess2;
  double x, fa, fb, fx, errorVal;

  do {
    x = (a + b) / 2;
    fa = evaluateFunction(equation, a);
    fb = evaluateFunction(equation, b);
    // fx = evaluateFunction(equation, x); // f(x)
    fx = evaluateFunction(equation, x); // f(x)

    errorVal = ((b - a) / 2).abs();

    iterations.add({
      'Iteration': iter,
      'a': a,
      'b': b,
      'f(a)': fa,
      'f(b)': fb,
      'x': x,
      'f(x)': fx, // f(x)
      'Error': errorVal.toStringAsFixed(6),
    });

    if (fa * fx < 0) {
      b = x;
    } else {
      a = x;
    }

    iter++;
  } while (errorVal > error);

  return BisectionResult(
    iterations: iterations,
    xApproximation: x,
  );
}

double evaluateFunction(String expression, double value) {
  final equation = expression.toSingleVariableFunction('x');
  final result = equation(value) as double;

  // You need to implement function evaluation logic here
  // This is just a placeholder
  // Example: You can use math library or other methods for evaluation
  return result;
}

// double evaluateFunction(String expression, double value) {
//   Parser p = Parser();
//   Expression exp = p.parse(expression);
//   ContextModel cm = ContextModel();
//   cm.bindVariable(Variable('x'), Number(value));
//   return exp.evaluate(EvaluationType.REAL, cm).toDouble();
// }
