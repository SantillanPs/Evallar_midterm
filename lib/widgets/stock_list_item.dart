import 'package:flutter/material.dart';
import '../models/stock.dart';

class StockListItem extends StatelessWidget {
  final Stock stock;

  const StockListItem({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            stock.symbol.substring(0, min(2, stock.symbol.length)),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      title: Text(
        stock.symbol,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(stock.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${stock.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    stock.change >= 0
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: stock.change >= 0 ? Colors.green : Colors.red,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${stock.change >= 0 ? '+' : ''}${stock.change.toStringAsFixed(2)} (${stock.change >= 0 ? '+' : ''}${stock.changePercentage.toStringAsFixed(2)}%)',
                    style: TextStyle(
                      color: stock.change >= 0 ? Colors.green : Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: () {},
    );
  }
}

// Helper function since dart:math's min isn't automatically imported
int min(int a, int b) {
  return a < b ? a : b;
}
