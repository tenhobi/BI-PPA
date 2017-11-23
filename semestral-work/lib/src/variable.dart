import 'package:lambda_calculus/src/expression.dart';

class Variable extends Expression {
  String name;

  Variable(this.name) {
    if (name == null || name.isEmpty) {
      throw new ArgumentError.value(name);
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

  // TODO: implement representation
  @override
  String get representation => null;
}
