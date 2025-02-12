import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:zakat_calculator/models/asset.dart';
import 'package:zakat_calculator/models/liability.dart';
import 'package:zakat_calculator/services/zakat_service.dart';

void main() {
  test("Zakat Calculation Test", () {
    List<Asset> assets = [
      Asset(type: "Cash", amount: 5000),
      Asset(type: "Gold", amount: 10000),
    ];

    List<Liability> liabilities = [
      Liability(type: "Loan", amount: 2000),
    ];

    ZakatService zakatService = ZakatService(
      assets: assets,
      liabilities: liabilities,
      goldPricePerGram: 60.0,
      silverPricePerGram: 0.8,
      useGoldNisab: true, // Ensure correct Nisab usage
    );

    double zakatDue = zakatService.calculateZakat();
    expect(zakatDue, closeTo(325.0, 0.01)); // ✅ Corrected expected value
  });
}
