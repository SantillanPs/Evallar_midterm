import 'package:flutter/material.dart';
import '../main.dart';

class PortfolioSummaryCard extends StatelessWidget {
  const PortfolioSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withOpacity(0.05),
              colorScheme.surface,
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Portfolio Value',
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$8,245.32',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.positiveGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_upward,
                        color: AppTheme.positiveGreen,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '5.42%',
                        style: TextStyle(
                          color: AppTheme.positiveGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: _PortfolioStatItem(
                      label: 'Day Gain',
                      value: '+\$128.32',
                      isPositive: true,
                    ),
                  ),
                  Expanded(
                    child: _PortfolioStatItem(
                      label: 'Total Gain',
                      value: '+\$835.65',
                      isPositive: true,
                    ),
                  ),
                  Expanded(
                    child: _PortfolioStatItem(
                      label: 'Buying Power',
                      value: '\$1,523.67',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Deposit'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_outward, size: 18),
                    label: const Text('Withdraw'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PortfolioStatItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isPositive;

  const _PortfolioStatItem({
    required this.label,
    required this.value,
    this.isPositive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color valueColor;
    if (value.startsWith('+') || value.startsWith('-')) {
      valueColor = isPositive
          ? (theme.brightness == Brightness.dark
              ? AppTheme.positiveGreenDark
              : AppTheme.positiveGreen)
          : (theme.brightness == Brightness.dark
              ? AppTheme.negativeRedDark
              : AppTheme.negativeRed);
    } else {
      valueColor = colorScheme.onSurface;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
