class NisabChecker {
  static const double goldNisabGrams = 87.48;
  static const double silverNisabGrams = 612.36;

  static double getNisabValue(double goldPrice, double silverPrice,
      {bool useGold = true}) {
    return goldPrice * goldNisabGrams + silverPrice * silverNisabGrams;
  }
}
