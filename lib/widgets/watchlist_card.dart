import 'package:flutter/material.dart';
import '../models/stock.dart';

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Stock> watchlist = [
      Stock(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        price: 178.72,
        change: 0.85,
        changePercentage: 0.48,
      ),
      Stock(
        symbol: 'TSLA',
        name: 'Tesla Inc.',
        price: 175.43,
        change: 5.77,
        changePercentage: 3.40,
      ),
      Stock(
        symbol: 'MSFT',
        name: 'Microsoft Corporation',
        price: 327.29,
        change: 1.41,
        changePercentage: 0.43,
      ),
      Stock(
        symbol: 'GOOGL',
        name: 'Alphabet Inc.',
        price: 142.65,
        change: -0.35,
        changePercentage: -0.24,
      ),
    ];

    return Card(
      child: Column(
        children: [
          for (int i = 0; i < watchlist.length; i++)
            Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  title: Text(
                    watchlist[i].symbol,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(watchlist[i].name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$${watchlist[i].price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                watchlist[i].change >= 0
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: watchlist[i].change >= 0
                                    ? Colors.green
                                    : Colors.red,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${watchlist[i].change >= 0 ? '+' : ''}${watchlist[i].change.toStringAsFixed(2)} (${watchlist[i].change >= 0 ? '+' : ''}${watchlist[i].changePercentage.toStringAsFixed(2)}%)',
                                style: TextStyle(
                                  color: watchlist[i].change >= 0
                                      ? Colors.green
                                      : Colors.red,
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
                ),
                if (i < watchlist.length - 1)
                  const Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
