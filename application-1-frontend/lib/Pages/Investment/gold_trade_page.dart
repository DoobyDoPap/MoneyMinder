import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoldTradePage(),
    );
  }
}

class GoldTradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gold Trade'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Precious Metals Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildGoldPriceCard(
                metalType: 'Gold',
                pricePerGram: '₹6,000',
              ),
              SizedBox(height: 16),
              _buildGoldPriceCard(
                metalType: 'Silver',
                pricePerGram: '₹70',
              ),
              SizedBox(height: 16),
              _buildDiamondGemCard(
                gemType: 'Diamond',
                pricePerCarat: '₹60,000',
              ),
              SizedBox(height: 16),
              Text(
                'Why Invest in Gold?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildInvestmentInfo(
                'Hedge Against Inflation: Gold often retains its value during inflationary periods.',
              ),
              _buildInvestmentInfo(
                'Diversification: Adding gold to a portfolio can help spread risk.',
              ),
              _buildInvestmentInfo(
                'Safe Haven: Investors turn to gold during economic uncertainties.',
              ),
              SizedBox(height: 16),
              Text(
                'Other Precious Metals and Gems',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildInvestmentInfo(
                'Silver: Considered both an industrial metal and a precious metal. Used in various industries and also as an investment.',
              ),
              _buildInvestmentInfo(
                'Diamonds: Valuable gemstones with high demand in the jewelry industry.',
              ),
              _buildInvestmentInfo(
                'Gems: Gemstones like sapphires, rubies, and emeralds can also be valuable investments.',
              ),
              SizedBox(height: 16),
              Text(
                'Gold Value Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildGoldValueCalculator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoldPriceCard(
      {required String metalType, required String pricePerGram}) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metalType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price per Gram: $pricePerGram',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiamondGemCard(
      {required String gemType, required String pricePerCarat}) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gemType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price per Carat: $pricePerCarat',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentInfo(String info) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            info,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildGoldValueCalculator(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController purityController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Gold Weight (grams)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: purityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Gold Purity (%)'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            double weight = double.parse(weightController.text);
            double purity = double.parse(purityController.text);

            // Metal value calculation formula: Value = (Weight * Purity * Price per Gram) / 100
            double metalValue = (weight * purity * 5000) / 100;

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Gold Value Calculation'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Gold Weight: $weight grams'),
                    Text('Gold Purity: $purity%'),
                    SizedBox(height: 8),
                    Text(
                        'Estimated Metal Value: ₹${metalValue.toStringAsFixed(2)}'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: Text('Calculate Metal Value'),
        ),
      ],
    );
  }
}
