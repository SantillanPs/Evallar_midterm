import 'package:flutter/material.dart';
import '../widgets/portfolio_chart.dart';
import '../widgets/portfolio_holdings.dart';
import '../models/holding.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final List<Holding> _holdings = [
    Holding(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      shares: 10,
      averageCost: 165.30,
      currentPrice: 178.72,
    ),
    Holding(
      symbol: 'MSFT',
      name: 'Microsoft Corporation',
      shares: 5,
      averageCost: 310.20,
      currentPrice: 327.29,
    ),
    Holding(
      symbol: 'TSLA',
      name: 'Tesla Inc.',
      shares: 8,
      averageCost: 190.50,
      currentPrice: 175.43,
    ),
    Holding(
      symbol: 'NVDA',
      name: 'NVIDIA Corporation',
      shares: 3,
      averageCost: 750.00,
      currentPrice: 853.98,
    ),
  ];

  double get _totalValue {
    double total = 0;
    for (var holding in _holdings) {
      total += holding.currentValue;
    }
    return total;
  }

  double get _totalGainLoss {
    double total = 0;
    for (var holding in _holdings) {
      total += holding.gainLossValue;
    }
    return total;
  }

  double get _totalGainLossPercentage {
    double totalCost = 0;
    for (var holding in _holdings) {
      totalCost += holding.totalCost;
    }
    return (_totalGainLoss / totalCost) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Portfolio value card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Value',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${_totalValue.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            _totalGainLoss >= 0
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color:
                                _totalGainLoss >= 0 ? Colors.green : Colors.red,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '\$${_totalGainLoss.abs().toStringAsFixed(2)} (${_totalGainLossPercentage.abs().toStringAsFixed(2)}%)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: _totalGainLoss >= 0
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          const Text(
                            ' Today',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Portfolio chart
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PortfolioChart(),
                ),
              ),
              const SizedBox(height: 16),

              // Holdings
              const Text(
                'Holdings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              PortfolioHoldings(holdings: _holdings),
            ],
          ),
        ),
      ),
    );
  }
}
