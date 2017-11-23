import 'package:lambda_calculus/src/expression.dart';

class Application extends Expression {
  List<Expression> expressions;

  Application(this.expressions) {
    if (expressions == null || expressions.isEmpty) {
      throw new ArgumentError.value(expressions);
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
