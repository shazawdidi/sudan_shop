import 'package:flutter/material.dart';

import '../../../utils/images.dart';
import 'category_items.dart';

class CategoriesWidget extends StatelessWidget {
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

    CategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width-40,
        height: MediaQuery.of(context).size.height/4.8,
        child: GridView.count(
          crossAxisCount: 4, // You can adjust the number of columns as needed
          children: List.generate(
            categories.length,
                (index) {
              return CategoryItem(
                imageAsset: categories[index]['image'],
                title: categories[index]['title'],
              );
            },
          ),
        ),
      ),
    );
  }
}
