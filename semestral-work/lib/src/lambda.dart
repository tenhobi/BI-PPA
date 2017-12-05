import 'package:lambda_calculus/src/expression.dart';
import 'package:lambda_calculus/src/variable.dart';

class Lambda extends Expression {
  Variable argument;
  Expression body;

  Lambda(String argument, this.body) : argument = new Variable(argument) {
    if (argument == null) {
      throw new ArgumentError.value(argument);
    }

    if (body == null) {
      throw new ArgumentError.value(body);
    }
  }

  @override
  void alphaReduction() {
    // TODO: implement alphaReduction
  }

  @override
  void betaReduction() {
    // TODO: implement betaReduction
  }

  @override
  void detectVariables() {
    // TODO: implement detectVariables
  }

  @override
  void evaulateApplicationally() {
    // TODO: implement evaulateApplicationally
  }

  @override
  void evaulateNormally() {
    // TODO: implement evaulateNormally
  }

  // TODO: implement textRepresentation
  @override
  String get textRepresentation => null;
}
