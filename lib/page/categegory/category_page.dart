import 'package:flutter/material.dart';
import 'package:sd_shop/page/categegory/widgets/category_items.dart';

import '../../utils/images.dart';



class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _selectedCategory = ""; // Variable to hold the selected category

  // Method to build a category card
  Widget _buildCategoryCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Set the selected category when a category card is tapped
        setState(() {
          _selectedCategory = title;
        });
      },
      child: Container(
        width: 100.0,
        margin: EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          color:
          _selectedCategory == title ? Colors.orangeAccent[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              imagePath,
              width: 100.0,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sample category data
    final List<Map<String, String>> categories = [
      {'image': food, 'title': 'Food'},
      {'image': fashion, 'title': 'Fashion'},
      {'image': handMade, 'title': 'Ha Made'},
      {'image': care, 'title': 'B&Care'},
      {'image': food, 'title': 'Food'},
      {'image': fashion, 'title': 'Fashion'},
      {'image': handMade, 'title': 'Ha Made'},
      {'image': care, 'title': 'B&Care'},

      // Add more categories as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width-40,
        height: MediaQuery.of(context).size.height/4.8,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return  CategoryItem(
              imageAsset: categories[index]['image'],
              title: categories[index]['title'],
            );
          },
        ),
      ),
    );
  }
}
