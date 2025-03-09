import 'package:flutter/material.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        'type': 'buy',
        'symbol': 'AAPL',
        'shares': 5,
        'price': 175.42,
        'date': 'Mar 8, 2025',
      },
      {
        'type': 'sell',
        'symbol': 'TSLA',
        'shares': 2,
        'price': 173.21,
        'date': 'Mar 7, 2025',
      },
      {
        'type': 'buy',
        'symbol': 'NVDA',
        'shares': 1,
        'price': 850.25,
        'date': 'Mar 5, 2025',
      },
    ];

    return Card(
      child: Column(
        children: [
          for (int i = 0; i < transactions.length; i++)
            Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: transactions[i]['type'] == 'buy'
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    child: Icon(
                      transactions[i]['type'] == 'buy'
                          ? Icons.add
                          : Icons.remove,
                      color: transactions[i]['type'] == 'buy'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        transactions[i]['type'] == 'buy' ? 'Bought ' : 'Sold ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${transactions[i]['shares']} ${transactions[i]['symbol']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'at \$${transactions[i]['price']} • ${transactions[i]['date']}',
                  ),
                  trailing: Text(
                    '\$${(transactions[i]['shares'] * transactions[i]['price']).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (i < transactions.length - 1)
                  const Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {},
              child: const Text('View All Transactions'),
            ),
          ),
        ],
      ),
    );
  }
}
