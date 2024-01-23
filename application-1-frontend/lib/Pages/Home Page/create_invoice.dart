import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: InvoicePage(),
    );
  }
}

class InvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Name: John Doe',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Phone Number: +1 123-456-7890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email ID: john.doe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Amount: \$100.00',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'GST: \$10.00',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Discount: \$5.00',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 8),
            Text(
              'Total: \$105.00',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
