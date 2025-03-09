class Stock {
  final String symbol;
  final String name;
  final double price;
  final double change;
  final double changePercentage;

  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercentage,
  });
}
