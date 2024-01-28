// ignore_for_file: must_be_immutable

import 'package:MoneyMinder/Utils/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AchievementPage(),
    );
  }
}

class AchievementPage extends StatelessWidget {
  final int totalTransactions = 50;
  final double totalSavings = 5000.0;
  int achievementPoints = 0;

  AchievementPage() {
    calculateAchievementPoints();
  }

  void calculateAchievementPoints() {
    int transactionCriteria = 25;
    double savingsCriteria = 1000.0;

    int transactionPoints = totalTransactions ~/ transactionCriteria;
    int savingsPoints = (totalSavings / savingsCriteria).floor();

    achievementPoints = transactionPoints + savingsPoints;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievement Page'),
      ),
      backgroundColor: Color(0xFF1E2A38), // Use a darker color code
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achievement Points: $achievementPoints',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Achievements:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildAchievementCard(
                    title: 'Transaction Master',
                    description: 'Made $totalTransactions transactions',
                    pointsEarned: totalTransactions ~/ 25,
                  ),
                  SizedBox(height: 8),
                  _buildAchievementCard(
                    title: 'Savings Guru',
                    description: 'Saved ₹$totalSavings',
                    pointsEarned: (totalSavings / 1000).floor(),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Earn More Points:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildEarnPointsTile('Refer a friend', 10),
                  SizedBox(height: 8),
                  _buildEarnPointsTile('Complete a survey', 5),
                  SizedBox(height: 8),
                  _buildEarnPointsTile('Make a new investment', 15),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Coupon Codes:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildCouponCodeCard(
                    title: '20% Off on Electronics',
                    requiredPoints: 5,
                    context: context,
                  ),
                  SizedBox(height: 8),
                  _buildCouponCodeCard(
                    title: 'Free Coffee at Starbucks',
                    requiredPoints: 10,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(
      {required String title,
      required String description,
      required int pointsEarned}) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Points Earned: $pointsEarned',
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

  Widget _buildEarnPointsTile(String activity, int points) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: youngblue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Earn $points points',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCodeCard(
      {required String title,
      required int requiredPoints,
      required BuildContext context}) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Required Points: $requiredPoints',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: achievementPoints >= requiredPoints
                  ? () => _showCouponDialog(title, context)
                  : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text(
                'Redeem Coupon',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCouponDialog(String couponTitle, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Coupon Redeemed'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Congratulations! You have successfully redeemed the coupon:'),
            SizedBox(height: 8),
            Text(
              couponTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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
  }
}
