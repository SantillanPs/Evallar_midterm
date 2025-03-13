import 'package:flutter/material.dart';
import '../models/stock.dart';
import '../main.dart';

class StockListItem extends StatelessWidget {
  final Stock stock;

  const StockListItem({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isPositive = stock.change >= 0;
    final changeColor = isPositive
        ? (theme.brightness == Brightness.dark
            ? AppTheme.positiveGreenDark
            : AppTheme.positiveGreen)
        : (theme.brightness == Brightness.dark
            ? AppTheme.negativeRedDark
            : AppTheme.negativeRed);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary.withOpacity(0.7),
                colorScheme.primary,
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              stock.symbol.substring(0, min(2, stock.symbol.length)),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
          ),
        ),
        title: Text(
          stock.symbol,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          stock.name,
          style: TextStyle(
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      color: changeColor,
                      size: 14,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${isPositive ? '+' : ''}${stock.change.toStringAsFixed(2)} (${isPositive ? '+' : ''}${stock.changePercentage.toStringAsFixed(2)}%)',
                      style: TextStyle(
                        color: changeColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurface.withOpacity(0.5),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}

// Helper function since dart:math's min isn't automatically imported
int min(int a, int b) {
  return a < b ? a : b;
}
