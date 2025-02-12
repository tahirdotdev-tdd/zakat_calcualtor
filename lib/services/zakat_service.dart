import 'package:zakat_calculator/utils/nisab_checker.dart';

import '../models/asset.dart';
import '../models/liability.dart';

class ZakatService {
  late final List<Asset> assets;
  late final List<Liability> liabilities;
  late final double goldPricePerGram;
  late final double silverPricePerGram;
  late final bool useGoldNisab; // Fixed spelling

  ZakatService({
    required this.assets,
    required this.liabilities,
    required this.goldPricePerGram,
    required this.silverPricePerGram,
    this.useGoldNisab = true, // Corrected the boolean name
  });

  double calculateTotalAssets() {
    return assets.fold(0, (sum, asset) => sum + asset.amount);
  }

  double calculateTotalLiabilities() {
    return liabilities.fold(0, (sum, liability) => sum + liability.amount);
  }

  double calculateZakat() {
    double totalAssets = calculateTotalAssets();
    double totalLiabilities = calculateTotalLiabilities();
    double netWealth = totalAssets - totalLiabilities;

    double nisaabValue = NisabChecker.getNisabValue(
        goldPricePerGram, silverPricePerGram,
        useGold: useGoldNisab);

    if (netWealth >= nisaabValue) {
      return 0.025 * netWealth; // Corrected calculation
    } else {
      return 0.0; // No zakat required
    }
  }
}
