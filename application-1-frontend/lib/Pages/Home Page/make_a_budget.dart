// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  TextEditingController _monthlyIncomeController = TextEditingController();
  TextEditingController _monthlyExpensesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Monthly Income:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _monthlyIncomeController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Monthly Expenses:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _monthlyExpensesController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _calculateSavings();
              },
              child: Text('Calculate Savings'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateSavings() {
    double income = double.tryParse(_monthlyIncomeController.text) ?? 0.0;
    double expenses = double.tryParse(_monthlyExpensesController.text) ?? 0.0;

    double savings = income - expenses;

    _showResultDialog(savings);
  }

  void _showResultDialog(double savings) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Savings Result'),
          content: Text('You can save $savings every month.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
