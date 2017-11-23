import 'package:lambda_calculus/lambdacalculus.dart';

void main() {
  Expression expression = new Application([
    new Lambda(
      "x",
      new Application([
        new Variable("x"),
        new Variable("x"),
      ]),
    ),
    new Variable("y"),
  ]);

  print(expression);

  expression.detectVariables();
}
