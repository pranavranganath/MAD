import 'package:flutter/material.dart';
import 'payment_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final Map<String, List<String>> categoryOptions = {
    'Medical': ['Hospital Bills', 'Medical Research', 'Medicine'],
    'Education': ['Scholarships', 'School Supplies', 'Educational Programs'],
    'Sports': ['Sports Equipment', 'Athlete Sponsorship', 'Sports Events'],
    'Shelter': ['Homeless Shelter', 'Animal Shelter', 'Emergency Shelter'],
    'Food': ['Food Banks', 'Meals for Homeless', 'Community Kitchens'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: ListView(
        children: categoryOptions.keys.map((category) {
          return CategoryTile(
            category: category,
            options: categoryOptions[category]!,
          );
        }).toList(),
      ),
    );
  }
}

class CategoryTile extends StatefulWidget {
  final String category;
  final List<String> options;

  CategoryTile({required this.category, required this.options});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: _getIconForCategory(widget.category),
        title: Text(widget.category),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select a donation type'),
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        category: widget.category,
                        donationType: newValue!,
                      ),
                    ),
                  );
                });
              },
              items: widget.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Icon _getIconForCategory(String category) {
    switch (category) {
      case 'Medical':
        return Icon(Icons.local_hospital);
      case 'Education':
        return Icon(Icons.school);
      case 'Sports':
        return Icon(Icons.sports);
      case 'Shelter':
        return Icon(Icons.home);
      case 'Food':
        return Icon(Icons.fastfood);
      default:
        return Icon(Icons.category);
    }
  }
}
