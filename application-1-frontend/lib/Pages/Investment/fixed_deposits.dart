import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FixedDepositPage(),
    );
  }
}

class FixedDepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixed Deposit Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fixed Deposit Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'A Fixed Deposit (FD) is a financial instrument provided by banks that allows individuals to deposit a lump sum amount for a fixed tenure at a predetermined interest rate. It is a low-risk investment option that provides stable returns over time.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard('Interest Rate', '8% per annum'),
                  _buildInfoCard('Tenure', '5 years'),
                  _buildInfoCard('Minimum Deposit', '₹1,000'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Eligibility Criteria',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildEligibility(
                  'Individuals and Hindu Undivided Families (HUFs)'),
              _buildEligibility('Resident Indians'),
              _buildEligibility('Minors with a guardian'),
              SizedBox(height: 16),
              Text(
                'Benefits',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildBenefit('High-interest rates'),
              _buildBenefit('Tax-saving option'),
              _buildBenefit('Flexible tenure options'),
              SizedBox(height: 16),
              Text(
                'How to Apply',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Visit our nearest branch to open a fixed deposit account.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Fixed Deposit Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildFDCalculator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEligibility(String criteria) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        Text(
          criteria,
          style: TextStyle(fontSize: 16),
        ),
      ],
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

  Widget _buildFDCalculator(BuildContext context) {
    TextEditingController principalController = TextEditingController();
    TextEditingController tenureController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: principalController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Principal Amount (₹)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: tenureController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Tenure (in years)'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            double principal = double.parse(principalController.text);
            int tenure = int.parse(tenureController.text);

            // Simple interest formula: SI = P * R * T / 100
            double interest = (principal * 8 * tenure) / 100;
            double maturityAmount = principal + interest;

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Fixed Deposit Calculation'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Principal Amount: ₹$principal'),
                    Text('Interest Earned: ₹$interest'),
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
