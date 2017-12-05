abstract class Expression {
  String get textRepresentation;

  void detectVariables();

  void betaReduction();

  void alphaReduction();

  void evaulateNormally();

  void evaulateApplicationally();

  @override
  String toString() => "$textRepresentation";
}
