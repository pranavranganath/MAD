import 'package:flutter/material.dart';

class UrgentFundraisersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urgent Fundraisers'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFundraiserCard(
              'assets/Vmatch logo.png',
              'Help the poor for better education',
              'Very Urgent',
              '\$1500',
              'Education',
            ),
            _buildFundraiserCard(
              'assets/Vmatch logo.png',
              'Help the poor for better education',
              'Very Urgent',
              '\$1500',
              'Education',
            ),
            _buildFundraiserCard(
              'assets/Vmatch logo.png',
              'Help the poor for better education',
              'Very Urgent',
              '\$1500',
              'Education',
            ),
            _buildFundraiserCard(
              'assets/Vmatch logo.png',
              'Help the poor for better education',
              'Very Urgent',
              '\$1500',
              'Education',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFundraiserCard(String imagePath, String title, String urgency, String amount, String category) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(urgency, style: TextStyle(color: Colors.red)),
            Text(category),
          ],
        ),
        trailing: Text(amount, style: TextStyle(color: Colors.orange)),
      ),
    );
  }
}
