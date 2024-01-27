import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  final String title;
  final String date;
  final double amount;
  final bool isIncome;

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction History',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: TransactionHistoryPage(),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        title: 'Groceries', date: '2022-02-15', amount: -50.0, isIncome: false),
    Transaction(
        title: 'Salary', date: '2022-02-10', amount: 2000.0, isIncome: true),
    Transaction(
        title: 'Dinner with friends',
        date: '2022-02-05',
        amount: -30.0,
        isIncome: false),
    Transaction(
        title: 'Freelance work',
        date: '2022-02-02',
        amount: 300.0,
        isIncome: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: transactions.isEmpty
            ? Center(
                child: Text('No transactions yet.'),
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  Transaction transaction = transactions[index];
                  return _buildTransactionCard(transaction);
                },
              ),
      ),
    );
  }

  Widget _buildTransactionCard(Transaction transaction) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          transaction.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(transaction.date),
        trailing: Text(
          '${transaction.isIncome ? '+' : '-'} ₹${transaction.amount.abs().toStringAsFixed(2)}',
          style: TextStyle(
            color: transaction.isIncome ? Colors.green : Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
