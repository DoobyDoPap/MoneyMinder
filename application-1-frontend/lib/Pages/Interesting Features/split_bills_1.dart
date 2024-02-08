import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(SplitBillsApp());
}

class SplitBillsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split Bills',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: SplitBillsPage(),
    );
  }
}

class SplitBillsPage extends StatefulWidget {
  @override
  _SplitBillsPageState createState() => _SplitBillsPageState();
}

class _SplitBillsPageState extends State<SplitBillsPage> {
  int _numberOfPeople = 2;
  double _totalAmount = 0;
  double _splitAmount = 0;

  final _currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Split Bills'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Total Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0),
              onChanged: (value) {
                setState(() {
                  _totalAmount = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Number of People',
                prefixIcon: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.0),
              onChanged: (value) {
                setState(() {
                  _numberOfPeople = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _calculateSplit,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Split Evenly',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 32.0),
            if (_splitAmount > 0)
              Text(
                'Split Amount per Person:',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            if (_splitAmount > 0)
              Text(
                '${_currencyFormat.format(_splitAmount)}',
                style: TextStyle(fontSize: 24.0, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }

  void _calculateSplit() {
    setState(() {
      _splitAmount = _totalAmount / _numberOfPeople;
    });
  }
}
