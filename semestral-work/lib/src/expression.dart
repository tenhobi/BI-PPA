abstract class Expression {
  String get representation;

  void detectVariables();

  void betaReduction();

  void alphaReduction();

  void evaulateNormally();

  void evaulateApplicationally();

  @override
  String toString() {
    return representation;
  }
}
