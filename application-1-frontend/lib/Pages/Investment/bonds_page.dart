import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BondsPage(),
    );
  }
}

class BondsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bonds Overview'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bonds Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildBondCard(
                bondName: 'Government Bond',
                interestRate: '5%',
                maturityDate: '2026-12-31',
              ),
              SizedBox(height: 16),
              _buildBondCard(
                bondName: 'Corporate Bond',
                interestRate: '4.5%',
                maturityDate: '2024-08-15',
              ),
              SizedBox(height: 24),
              Text(
                'Why Invest in Bonds?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildInvestmentInfo(
                'Stable Income: Bonds provide a fixed interest rate, ensuring a regular income stream.',
              ),
              _buildInvestmentInfo(
                'Capital Preservation: Bonds are generally considered safer than stocks, making them suitable for capital preservation.',
              ),
              _buildInvestmentInfo(
                'Diversification: Including bonds in your investment portfolio can help spread risk and balance overall performance.',
              ),
              _buildInvestmentInfo(
                'Lower Volatility: Bonds tend to have lower price volatility compared to stocks, reducing the risk of significant value fluctuations.',
              ),
              _buildInvestmentInfo(
                'Predictable Returns: The fixed interest rate and maturity date of bonds allow for more predictable returns compared to other investments.',
              ),
              SizedBox(height: 24),
              Text(
                'Tips for Bond Investing',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              _buildInvestmentInfo(
                'Understand Your Risk Tolerance: Assess your risk tolerance before investing in bonds to choose the right type.',
              ),
              _buildInvestmentInfo(
                'Diversify Your Portfolio: Spread your investments across different types of bonds to reduce risk.',
              ),
              _buildInvestmentInfo(
                'Consider Your Investment Goals: Align your bond investments with your financial goals, whether it\'s income, growth, or capital preservation.',
              ),
              _buildInvestmentInfo(
                'Stay Informed: Keep track of economic indicators and interest rate changes that may impact bond prices.',
              ),
              SizedBox(height: 24),
              Text(
                'Bond Market Statistics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildMarketStatistics(),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Start Investing Today!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildCTAButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBondCard({
    required String bondName,
    required String interestRate,
    required String maturityDate,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bondName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Interest Rate: $interestRate',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Maturity Date: $maturityDate',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentInfo(String info) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            info,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildMarketStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatisticItem('Average Yield', '3.8%'),
        _buildStatisticItem('Market Size', '₹12 Trillion'),
        _buildStatisticItem('Bond Issuers', '120'),
      ],
    );
  }

  Widget _buildStatisticItem(String label, String value) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTAButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add navigation or other actions here
      },
      child: Text('Get Started'),
    );
  }
}
