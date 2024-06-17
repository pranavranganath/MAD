import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'urgent_fundraisers_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    UrgentFundraisersScreen(),//change when we get our categories page 
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Start Your Own Funding',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Urgent Fundraisers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UrgentFundraisersScreen()),
                );
              },
              child: Text('See all'),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildFundraiserCard('assets/Vmatch logo.png', 'CAUSE 1', '\$55', 'VERY URGENT\nPOVERTY'),
                _buildFundraiserCard('assets/Vmatch logo.png', 'CAUSE 2', '\$60', 'VERY URGENT\nEDUCATION'),
                _buildFundraiserCard('assets/Vmatch logo.png', 'CAUSE 3', '\$30', 'VERY URGENT\nANIMAL WELFARE'),
                _buildFundraiserCard('assets/Vmatch logo.png', 'CAUSE 4', '\$40', 'VERY URGENT\nMEDICAL'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFundraiserCard(String imagePath, String title, String amount, String description) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(amount, style: TextStyle(color: Colors.orange)),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
