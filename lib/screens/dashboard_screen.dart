import 'package:flutter/material.dart';
import '../widgets/portfolio_summary_card.dart';
import '../widgets/watchlist_card.dart';
import '../widgets/market_overview_card.dart';
import '../widgets/recent_transactions_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message
              Text(
                'Good morning, Alex',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),

              // Portfolio summary
              PortfolioSummaryCard(),
              SizedBox(height: 16),

              // Watchlist
              Text(
                'Watchlist',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              WatchlistCard(),
              SizedBox(height: 16),

              // Market overview
              Text(
                'Market Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              MarketOverviewCard(),
              SizedBox(height: 16),

              // Recent transactions
              Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              RecentTransactionsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
