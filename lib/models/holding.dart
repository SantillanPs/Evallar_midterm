class Holding {
  final String symbol;
  final String name;
  final int shares;
  final double averageCost;
  final double currentPrice;

  Holding({
    required this.symbol,
    required this.name,
    required this.shares,
    required this.averageCost,
    required this.currentPrice,
  });

  double get totalCost => shares * averageCost;
  double get currentValue => shares * currentPrice;
  double get gainLossValue => currentValue - totalCost;
  double get gainLossPercentage => (gainLossValue / totalCost) * 100;
}
