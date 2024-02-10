import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SIPPage(),
    );
  }
}

class SIPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIP Overview'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous page
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
                'What is SIP?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Systematic Investment Plan (SIP) is a way to invest in mutual funds at regular intervals (weekly, monthly, quarterly, etc.) rather than a lump sum amount. It allows investors to start investing with small amounts and build wealth over time.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Benefits of SIP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildBenefit('Disciplined Investing'),
              _buildBenefit('Rupee Cost Averaging'),
              _buildBenefit('Flexibility'),
              _buildBenefit('Compounding Benefits'),
              SizedBox(height: 24),
              Text(
                'SIP Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildSIPCalculator(context),
            ],
          ),
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

  Widget _buildSIPCalculator(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController durationController = TextEditingController();
    TextEditingController interestRateController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: 'Monthly Investment Amount (₹)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: durationController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: 'Investment Duration (in years)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: interestRateController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: 'Expected Annual Return Rate (%)'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            double monthlyInvestment = double.parse(amountController.text);
            int duration = int.parse(durationController.text);
            double annualReturnRate = double.parse(interestRateController.text);

            double futureValue = monthlyInvestment *
                (((1 + (annualReturnRate / 100 / 12)) * (12 * duration)) - 1) /
                (annualReturnRate / 100 / 12);

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('SIP Investment Calculation'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Monthly Investment Amount: ₹$monthlyInvestment'),
                    Text('Investment Duration: $duration years'),
                    Text('Expected Annual Return Rate: $annualReturnRate%'),
                    SizedBox(height: 8),
                    Text('Future Value: ₹${futureValue.toStringAsFixed(2)}'),
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
          child: Text('Calculate SIP'),
        ),
      ],
    );
  }
}
