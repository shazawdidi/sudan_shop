import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sd_shop/page/categegory/widgets/category_widget.dart';
import 'package:sd_shop/page/home/widgets/home_slider.dart';

import '../trending/trending_products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'اكلاتنا'; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               40.height,
                 Text(
                  'WELCOME \n SudaShop :) amazing place for  Sudanese Products',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               20.height,
                HomeSlider(),
               14.height,
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                14.height,
                CategoriesWidget(),   14.height,
                Text(
                  'Trending Products',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                14.height,
                 TrendingProductWidget()
                // Use a conditional expression to display products based on selected category
                  // Add more product cards as needed for other categories
              ],
            ),
          ),
        ],
      ),
    );
  }

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
          color: _selectedCategory == title ? Colors.blue[100] : Colors.grey[200], // Change color based on selection
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

  Widget _buildProductCard(String name, String description, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.network(
          imagePath,
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        title: Text(name),
        subtitle: Text(description),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            // Add to cart action
          },
        ),
      ),
    );
  }
}
