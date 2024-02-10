import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealEstatePage(),
    );
  }
}

class RealEstatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate'),
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
                'Real Estate Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildPropertyCard(
                propertyName: 'Luxury Apartments',
                location: 'Mumbai',
                price: '₹1 Crore onwards',
              ),
              SizedBox(height: 16),
              _buildPropertyCard(
                propertyName: 'Villa with Garden',
                location: 'Bangalore',
                price: '₹2 Crores onwards',
              ),
              SizedBox(height: 16),
              Text(
                'Real Estate Market',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildMarketInfo('Stable growth in property values'),
              _buildMarketInfo('Increasing demand for affordable housing'),
              _buildMarketInfo(
                  'Government initiatives promoting real estate investment'),
              SizedBox(height: 16),
              Text(
                'Mortgage Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildMortgageCalculator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard(
      {required String propertyName,
      required String location,
      required String price}) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              propertyName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Location: $location',
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
          ],
        ),
      ),
    );
  }

  Widget _buildMarketInfo(String info) {
    return Row(
      children: [
        Icon(
          Icons.info,
          color: Colors.blue,
        ),
        SizedBox(width: 8),
        Text(
          info,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildMortgageCalculator(BuildContext context) {
    TextEditingController loanAmountController = TextEditingController();
    TextEditingController interestRateController = TextEditingController();
    TextEditingController tenureController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: loanAmountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Loan Amount (₹)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: interestRateController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Interest Rate (%)'),
        ),
        SizedBox(height: 8),
        TextField(
          controller: tenureController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Loan Tenure (in years)'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            double loanAmount = double.parse(loanAmountController.text);
            double interestRate = double.parse(interestRateController.text);
            int tenure = int.parse(tenureController.text);

            // Mortgage calculation formula: EMI = [P * r * (1+r)^n] / [(1+r)^n-1]
            double monthlyEMI = (loanAmount * interestRate / 1200) /
                (1 - (1 / pow(1 + interestRate / 1200, tenure * 12)));

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Mortgage Calculation'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Loan Amount: ₹$loanAmount'),
                    Text('Interest Rate: $interestRate%'),
                    Text('Loan Tenure: $tenure years'),
                    SizedBox(height: 8),
                    Text('Monthly EMI: ₹${monthlyEMI.toStringAsFixed(2)}'),
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
          child: Text('Calculate EMI'),
        ),
      ],
    );
  }
}
