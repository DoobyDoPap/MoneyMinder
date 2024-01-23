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

  Map<String, double> _budgetCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Monthly Income (in Rupees):',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _monthlyIncomeController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    color: Color.fromARGB(167, 48, 64, 241), fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Budget Categories:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 10),
              _buildBudgetCategories(),
              SizedBox(height: 20),
              _buildTotalBudgetCategories(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _calculateSavings();
                },
                child: Text('Calculate Savings'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontSize: 18),
                ),
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
                  style: TextStyle(fontSize: 16, color: Colors.blue),
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
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTotalBudgetCategories() {
    double totalBudgetCategories = _calculateTotalBudgetCategories();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total Monthly Expense: ',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          Text(
            '\₹${totalBudgetCategories.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
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
              Text('Total Savings: ₹$savings',
                  style: TextStyle(color: Colors.blue, fontSize: 18)),
              SizedBox(height: 10),
              Text(
                'Savings Rate : ${savingsRateVsExpenses.toStringAsFixed(2)}%',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK',
                  style: TextStyle(color: Colors.blue, fontSize: 18)),
            ),
          ],
        );
      },
    );
  }
}
