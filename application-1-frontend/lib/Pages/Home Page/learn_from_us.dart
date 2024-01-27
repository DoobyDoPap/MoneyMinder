import 'package:flutter/material.dart';

class UserGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Your Financial App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'How to Use the App:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Target Saving Money:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '   Set savings goals, track your progress, and achieve financial milestones.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Budget Creation:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '   Plan your spending, categorize expenses, and stick to your budget.',
              style: TextStyle(fontSize: 16),
            ),
            // Add similar sections for other features (investment options, split the bills, etc.)

            SizedBox(height: 16),
            Text(
              'Financial Awareness Tips:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Regularly review your transactions and expenses.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Explore investment options for long-term financial growth.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Emergency Fund:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '   Build an emergency fund to cover unexpected expenses and avoid debt.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Credit Score:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '   Understand the importance of your credit score and take steps to improve it.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '5. Diversify Investments:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '   Spread your investments across different assets to reduce risk.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '6. Retirement Planning:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '   Start planning for retirement early and contribute regularly to retirement accounts.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),
            Image.asset(
              'assets/images/logo.png', // Replace with your app's logo
              width: 100,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: UserGuidePage(),
    ),
  );
}
