import 'package:flutter/material.dart';

class LoanApplicationPage extends StatefulWidget {
  @override
  _LoanApplicationPageState createState() => _LoanApplicationPageState();
}

class _LoanApplicationPageState extends State<LoanApplicationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String selectedLoanType = 'Personal Loan';
  bool isEligible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Full Name'),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Age'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loan Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Loan Amount'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Select Loan Type',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: selectedLoanType,
                        onChanged: (newValue) {
                          setState(() {
                            selectedLoanType = newValue!;
                          });
                        },
                        items: ['Personal Loan', 'Home Loan', 'Car Loan']
                            .map((loanType) {
                          return DropdownMenuItem<String>(
                            value: loanType,
                            child: Text(loanType),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  checkEligibility();
                  // Add logic to submit the loan application
                },
                child: Text('Apply for Loan'),
              ),
              SizedBox(height: 20),
              isEligible
                  ? Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Congratulations! You are eligible for the loan.',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Benefits:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            if (selectedLoanType == 'Personal Loan')
                              ..._getPersonalLoanBenefits(),
                            if (selectedLoanType == 'Home Loan')
                              ..._getHomeLoanBenefits(),
                            if (selectedLoanType == 'Car Loan')
                              ..._getCarLoanBenefits(),
                          ],
                        ),
                      ),
                    )
                  : Text(
                      'Sorry, you are not eligible for the loan at the moment.',
                      style: TextStyle(color: Colors.red),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getPersonalLoanBenefits() {
    return [
      Text('- Quick approval process'),
      Text('- Flexible repayment options'),
      Text('- No collateral required'),
      // Add more personal loan benefits here
    ];
  }

  List<Widget> _getHomeLoanBenefits() {
    return [
      Text('- Competitive interest rates'),
      Text('- Extended repayment periods'),
      Text('- Tax benefits on home loan interest'),
      // Add more home loan benefits here
    ];
  }

  List<Widget> _getCarLoanBenefits() {
    return [
      Text('- Instant KYC'),
      Text('- Interest rate at just 2.5%'),
      Text('- ₹0 late fine'),
      Text('- Financing for new and used cars'),
      Text('- Competitive interest rates'),
      Text('- Quick loan processing for car purchase'),
      // Add more car loan benefits here
    ];
  }

  void checkEligibility() {
    // Implement eligibility criteria based on your requirements
    // For this example, eligibility is checked based on age and loan amount
    int userAge = int.tryParse(ageController.text) ?? 0;
    double loanAmount = double.tryParse(amountController.text) ?? 0.0;

    if (userAge >= 18 && loanAmount >= 5000) {
      setState(() {
        isEligible = true;
      });
    } else {
      setState(() {
        isEligible = false;
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: LoanApplicationPage(),
  ));
}
