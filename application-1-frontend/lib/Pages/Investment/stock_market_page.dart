import 'package:flutter/material.dart';

void main() {
  runApp(MyStockMarketApp());
}

class MyStockMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Market App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockMarketPage(),
    );
  }
}

class StockMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Market'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            _buildMenuItem(
              title: 'View Portfolio',
              icon: Icons.account_balance_wallet,
              onPressed: () {
                // Add functionality for 'View Portfolio'
              },
            ),
            _buildMenuItem(
              title: 'Stocks',
              icon: Icons.trending_up,
              onPressed: () {
                // Add functionality for 'Stocks'
              },
            ),
            _buildMenuItem(
              title: 'Market News',
              icon: Icons.new_releases,
              onPressed: () {
                // Add functionality for 'Market News'
              },
            ),
            _buildMenuItem(
              title: 'Watchlist',
              icon: Icons.visibility,
              onPressed: () {
                // Add functionality for 'Watchlist'
              },
            ),
            _buildMenuItem(
              title: 'Settings',
              icon: Icons.settings,
              onPressed: () {
                // Add functionality for 'Settings'
              },
            ),
            _buildMenuItem(
              title: 'Logout',
              icon: Icons.exit_to_app,
              onPressed: () {
                // Add functionality for 'Logout'
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 48.0, // Set the size of the icons
      ),
      label: Text(
        title,
        style: TextStyle(fontSize: 18.0), // Set the font size for the title
      ),
      style: ElevatedButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 24.0), // Adjust vertical padding
      ),
    );
  }
}
