import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MutualFundPage(),
    );
  }
}

class MutualFundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mutual Fund Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mutual Fund Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildFundCard(
                fundName: 'XYZ Equity Fund',
                fundType: 'Equity',
                returnRate: '12%',
              ),
              SizedBox(height: 16),
              _buildFundCard(
                fundName: 'ABC Debt Fund',
                fundType: 'Debt',
                returnRate: '8%',
              ),
              SizedBox(height: 16),
              Text(
                'How to Invest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Investing in mutual funds is easy. You can start by creating an account on our app and choosing the fund that suits your investment goals. Follow the on-screen instructions to complete the investment process.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Why Mutual Funds?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildBenefit('Diversification of Investments'),
              _buildBenefit('Professional Fund Management'),
              _buildBenefit('Liquidity'),
              SizedBox(height: 16),
              Text(
                'Mutual Fund Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildMutualFundCalculator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFundCard(
      {required String fundName,
      required String fundType,
      required String returnRate}) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fundName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Type: $fundType Fund',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Expected Return Rate: $returnRate',
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

  Widget _buildBenefit(String benefit) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        Text(
          benefit,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildMutualFundCalculator(BuildContext context) {
    TextEditingController investmentController = TextEditingController();
    TextEditingController durationController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: investmentController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Investment Amount (₹)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: durationController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: 'Investment Duration (in years)'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            double investment = double.parse(investmentController.text);
            int duration = int.parse(durationController.text);

            // Simple interest formula: SI = P * R * T / 100
            double expectedReturn = (investment * 12 * duration) / 100;
            double maturityAmount = investment + expectedReturn;

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Mutual Fund Investment Calculation'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Investment Amount: ₹$investment'),
                    Text('Expected Return: ₹$expectedReturn'),
                    Text('Maturity Amount: ₹$maturityAmount'),
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
          child: Text('Calculate'),
        ),
      ],
    );
  }
}
