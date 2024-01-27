import 'package:flutter/material.dart';

class TargetPage extends StatefulWidget {
  @override
  _TargetPageState createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  TextEditingController timePeriodController = TextEditingController();
  TextEditingController avgSavingsController = TextEditingController();
  TextEditingController targetAmountController = TextEditingController();

  double requiredMonthlySavings = 0.0;
  String investmentAdvice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investment Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text('\u20B9'), // Indian Rupee symbol
                SizedBox(width: 8),
                Text(
                  'Target Amount (in Rupees)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextField(
              controller: targetAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Target Amount'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.timeline), // Indian Rupee symbol
                SizedBox(width: 8),
                Text('Time Period (months)'),
              ],
            ),
            TextField(
              controller: timePeriodController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Time Period'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('\u20B9'), // Indian Rupee symbol
                SizedBox(width: 8),
                Text('Avg Savings per Month (in Rupees)'),
              ],
            ),
            TextField(
              controller: avgSavingsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Avg Savings'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateSavings();
                provideInvestmentAdvice();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('\u20B9'), // Indian Rupee symbol
                  SizedBox(width: 8),
                  Text('Calculate'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              requiredMonthlySavings > 0
                  ? 'Extra Monthly Savings Needed: ₹$requiredMonthlySavings'
                  : 'You are saving enough to reach your target!',
              style: TextStyle(
                color: requiredMonthlySavings > 0 ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  requiredMonthlySavings > 0
                      ? Icons.bar_chart
                      : Icons.money_off,
                  color: requiredMonthlySavings > 0 ? Colors.red : Colors.green,
                ),
                SizedBox(width: 8),
                Text(
                  'Investment Advice',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              investmentAdvice,
              style: TextStyle(
                  color:
                      requiredMonthlySavings > 0 ? Colors.red : Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  void calculateSavings() {
    double targetAmount = double.tryParse(targetAmountController.text) ?? 0.0;
    int timePeriod = int.tryParse(timePeriodController.text) ?? 1;
    double avgSavings = double.tryParse(avgSavingsController.text) ?? 0.0;

    double requiredSavings = targetAmount / timePeriod;
    requiredMonthlySavings = requiredSavings - avgSavings;

    if (requiredMonthlySavings < 0) {
      requiredMonthlySavings = 0;
    }

    setState(() {});
  }

  void provideInvestmentAdvice() {
    // Simple advice, consult with a financial advisor for accurate guidance
    if (requiredMonthlySavings > 0) {
      investmentAdvice =
          'Consider investing the extra ₹$requiredMonthlySavings in a diversified portfolio of stocks and bonds. Consult with a financial advisor for personalized guidance on investment options.';
    } else {
      investmentAdvice =
          'You are saving enough to reach your target. Consider keeping your savings in a high-yield savings account or other low-risk options to ensure the safety of your money.';
    }
    setState(() {});
  }
}

void main() {
  runApp(MaterialApp(
    home: TargetPage(),
  ));
}
