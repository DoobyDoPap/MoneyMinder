// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  TextEditingController _monthlyIncomeController = TextEditingController();
  Map<String, TextEditingController> _categoryControllers = {
    'Housing': TextEditingController(),
    'Utilities': TextEditingController(),
    'Groceries': TextEditingController(),
    'Transportation': TextEditingController(),
    'Entertainment': TextEditingController(),
    'Other': TextEditingController(),
  };

  Map<String, double> _budgetCategories = {}; // Declare _budgetCategories here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                'Budget Categories:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildBudgetCategories(),
              SizedBox(height: 10), // Add some space

              SizedBox(height: 10), // Add some space
              Text(
                'Total Monthly Expense: ${_calculateTotalBudgetCategories().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Add some space
              ElevatedButton(
                onPressed: () {
                  _calculateSavings();
                },
                child: Text('Calculate Savings'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetCategories() {
    return Column(
      children: _categoryControllers.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  entry.key,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: entry.value,
                  onChanged: (value) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  double _calculateTotalExpense() {
    return _budgetCategories.values.fold(0, (acc, val) => acc + val);
  }

  double _calculateTotalBudgetCategories() {
    return _categoryControllers.values.fold(0, (acc, controller) {
      double amount = double.tryParse(controller.text) ?? 0.0;
      return acc + amount;
    });
  }

  void _calculateSavings() {
    double income = double.tryParse(_monthlyIncomeController.text) ?? 0.0;

    double totalBudget = 0;
    _categoryControllers.forEach((key, controller) {
      double amount = double.tryParse(controller.text) ?? 0.0;
      _budgetCategories[key] = amount;
      totalBudget += amount;
    });

    double totalExpenses = _calculateTotalExpense();
    double savings = income - totalExpenses;

    double savingsRateVsExpenses = (savings / income) * 100;

    _showResultDialog(savings, savingsRateVsExpenses);
  }

  void _showResultDialog(double savings, double savingsRateVsExpenses) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Savings Result'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Total Savings: $savings'),
              SizedBox(height: 10),
              Text(
                  'Savings Rate : ${savingsRateVsExpenses.toStringAsFixed(2)}%'),
            ],
          ),
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
