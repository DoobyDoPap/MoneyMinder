import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CryptoMarketPage(),
    );
  }
}

class CryptoMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Market'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the investment page
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Cryptocurrencies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildCryptoCard(
                cryptoName: 'Bitcoin',
                symbol: 'BTC',
                price: '₹3,500,000',
                priceChange: '+5.2%',
              ),
              SizedBox(height: 16),
              _buildCryptoCard(
                cryptoName: 'Ethereum',
                symbol: 'ETH',
                price: '₹250,000',
                priceChange: '-2.8%',
              ),
              SizedBox(height: 16),
              _buildCryptoCard(
                cryptoName: 'Ripple',
                symbol: 'XRP',
                price: '₹120',
                priceChange: '+1.3%',
              ),
              SizedBox(height: 24),
              Text(
                'Price Trends',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildPriceChart(),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Start Investing in Cryptocurrency!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildCTAButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCryptoCard({
    required String cryptoName,
    required String symbol,
    required String price,
    required String priceChange,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cryptoName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Symbol: $symbol',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price Change: $priceChange',
              style: TextStyle(
                fontSize: 16,
                color: priceChange.startsWith('-') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceChart() {
    // Placeholder for a price chart widget (you can use a third-party library for charts)
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      // Your chart widget goes here
      child: Center(
        child: Text('Price Chart Placeholder'),
      ),
    );
  }

  Widget _buildCTAButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add navigation or other actions here
      },
      child: Text('Get Started'),
    );
  }
}
