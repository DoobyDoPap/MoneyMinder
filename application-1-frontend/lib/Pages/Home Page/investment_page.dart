import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment Options',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
      ),
      home: InvestmentOptionsPage(),
    );
  }
}

class InvestmentOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvestmentOptionCard(
              title: 'Mutual Funds',
              description: 'Diversify your investments through mutual funds.',
            ),
            SizedBox(height: 16),
            InvestmentOptionCard(
              title: 'Fixed Deposits',
              description: 'Earn fixed returns with low-risk fixed deposits.',
            ),
            SizedBox(height: 16),
            InvestmentOptionCard(
              title: 'Stock Market',
              description: 'Invest in stocks for potential high returns.',
            ),
            SizedBox(height: 16),
            InvestmentOptionCard(
              title: 'Real Estate',
              description:
                  'Explore real estate investments for long-term growth.',
            ),
            // Add more InvestmentOptionCard widgets for other options
          ],
        ),
      ),
    );
  }
}

class InvestmentOptionCard extends StatelessWidget {
  final String title;
  final String description;

  InvestmentOptionCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
