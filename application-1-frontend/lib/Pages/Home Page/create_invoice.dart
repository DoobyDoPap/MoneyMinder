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

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final double discountPercentage = 7;
  final double gstPercentage = 10;

  double calculateDiscount(double amount) {
    return (amount * discountPercentage) / 100;
  }

  double calculateGST(double amount) {
    return (amount * gstPercentage) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInputField('Customer Name', nameController),
            _buildInputField('Phone Number', phoneController),
            _buildInputField('Email ID', emailController),
            _buildInputField('Bill Amount (₹)', amountController),
            SizedBox(height: 8),
            _buildNote(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String phone = phoneController.text;
                String email = emailController.text;
                double amount = double.tryParse(amountController.text) ?? 0;

                double discount = calculateDiscount(amount);
                double gst = calculateGST(amount);
                double totalAmount = amount - discount + gst;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Invoice'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildInvoiceDetail('Customer Name', name),
                        _buildInvoiceDetail('Phone Number', phone),
                        _buildInvoiceDetail('Email ID', email),
                        SizedBox(height: 8),
                        Text('Details:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        _buildInvoiceDetail('Amount', '₹$amount'),
                        _buildInvoiceDetail('Discount (7%)', '-₹$discount'),
                        _buildInvoiceDetail('GST (10%)', '+₹$gst'),
                        Divider(),
                        _buildInvoiceDetail('Total', '₹$totalAmount'),
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
              },
              child: Text('Generate Invoice', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildNote() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Note: Discount (7%) and GST (10%) are fixed percentages applied to the bill amount.',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildInvoiceDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(text: '$label: '),
            TextSpan(
                text: value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
