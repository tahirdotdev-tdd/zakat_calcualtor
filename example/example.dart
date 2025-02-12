import 'package:zakat_calculator/zakat_calculator.dart';

void main() {
  // Example data
  List<Asset> myAssets = [
    Asset(type: "Cash", amount: 5000),
    Asset(type: "Gold", amount: 10000),
    Asset(type: "Stocks", amount: 3000),
  ];

  List<Liability> myLiabilities = [
    Liability(type: "Loan", amount: 2000),
  ];

  double goldPrice = 60.0; // Example: 60 USD per gram
  double silverPrice = 0.8; // Example: 0.8 USD per gram

  ZakatService zakatCalculator = ZakatService(
    assets: myAssets,
    liabilities: myLiabilities,
    goldPricePerGram: goldPrice,
    silverPricePerGram: silverPrice,
    useGoldNisab: true, // Change to false to use silver Nisab
  );

  double zakatDue = zakatCalculator.calculateZakat();
  print("Total Zakat Due: \$${zakatDue.toStringAsFixed(2)}");
}
