import 'package:flutter/material.dart';
import 'package:sd_shop/page/trending/widgets/trending_item.dart';

import '../../utils/images.dart';

class TrendingProductWidget extends StatelessWidget {

  final List<Map<String, String>> products = [
    {'image': product1, 'title': 'Sudan Th'},
    {'image': product2, 'title': 'Sudan Th'},
    {'image': product3, 'title': 'Sudan Th'},
    {'image': product1, 'title': 'Sudan Th'},
    {'image': product2, 'title': 'Sudan Th'},
    {'image': product3, 'title': 'Sudan Th'},
    // Add more products as needed
  ];

    TrendingProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/5,
      child: MediaQuery.removePadding(removeTop: true,context: context,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return TrendingItem(
              imageAsset: products[index]['image'],
              title: products[index]['title'],
            );
          },
        ),
      ),
    );
  }
}
