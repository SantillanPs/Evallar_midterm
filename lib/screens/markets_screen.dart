import 'package:flutter/material.dart';
import '../widgets/stock_list_item.dart';
import '../models/stock.dart';

class MarketsScreen extends StatefulWidget {
  const MarketsScreen({Key? key}) : super(key: key);

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Stock> _stocks = [
    Stock(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        price: 178.72,
        change: 0.85,
        changePercentage: 0.48),
    Stock(
        symbol: 'MSFT',
        name: 'Microsoft Corporation',
        price: 327.29,
        change: 1.41,
        changePercentage: 0.43),
    Stock(
        symbol: 'GOOGL',
        name: 'Alphabet Inc.',
        price: 142.65,
        change: -0.35,
        changePercentage: -0.24),
    Stock(
        symbol: 'AMZN',
        name: 'Amazon.com Inc.',
        price: 175.35,
        change: 2.18,
        changePercentage: 1.26),
    Stock(
        symbol: 'META',
        name: 'Meta Platforms Inc.',
        price: 484.66,
        change: -3.22,
        changePercentage: -0.66),
    Stock(
        symbol: 'TSLA',
        name: 'Tesla Inc.',
        price: 175.43,
        change: 5.77,
        changePercentage: 3.40),
    Stock(
        symbol: 'NVDA',
        name: 'NVIDIA Corporation',
        price: 853.98,
        change: 12.75,
        changePercentage: 1.52),
    Stock(
        symbol: 'BRK.A',
        name: 'Berkshire Hathaway Inc.',
        price: 621418.00,
        change: 1250.00,
        changePercentage: 0.20),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Stock> get _filteredStocks {
    if (_searchQuery.isEmpty) {
      return _stocks;
    }

    return _stocks
        .where((stock) =>
            stock.symbol.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            stock.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Markets',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Stocks'),
            Tab(text: 'Crypto'),
            Tab(text: 'Forex'),
            Tab(text: 'ETFs'),
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search stocks, ETFs, and more',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[200]
                    : Colors.grey[800],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Stocks tab
                ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredStocks.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    return StockListItem(stock: _filteredStocks[index]);
                  },
                ),
                // Placeholder for other tabs
                const Center(child: Text('Crypto coming soon')),
                const Center(child: Text('Forex coming soon')),
                const Center(child: Text('ETFs coming soon')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
