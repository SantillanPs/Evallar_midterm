import 'package:flutter/material.dart';

class MarketOverviewCard extends StatelessWidget {
  const MarketOverviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> indices = [
      {
        'name': 'S&P 500',
        'value': '5,256.52',
        'change': '+15.28',
        'changePercentage': '+0.29%',
        'isPositive': true,
      },
      {
        'name': 'Dow Jones',
        'value': '39,087.38',
        'change': '+47.25',
        'changePercentage': '+0.12%',
        'isPositive': true,
      },
      {
        'name': 'Nasdaq',
        'value': '16,396.83',
        'change': '-42.71',
        'changePercentage': '-0.26%',
        'isPositive': false,
      },
      {
        'name': 'Russell 2000',
        'value': '2,092.92',
        'change': '+8.40',
        'changePercentage': '+0.40%',
        'isPositive': true,
      },
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: indices.length,
        itemBuilder: (context, index) {
          final item = indices[index];

          return Card(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 8,
              right: index == indices.length - 1 ? 0 : 8,
            ),
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item['value'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        item['isPositive']
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        color: item['isPositive'] ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${item['change']} (${item['changePercentage']})',
                        style: TextStyle(
                          color: item['isPositive'] ? Colors.green : Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
