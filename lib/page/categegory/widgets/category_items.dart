import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sd_shop/utils/color.dart';

class CategoryItem extends StatelessWidget {
  final String? imageAsset;
  final String? title;

  const CategoryItem({
    Key? key,
    required this.imageAsset,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        InkWell(
          onTap: () {
            // Handle category item tap
          },
          child: Card(
            elevation: 1,
            color: white,
             child:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                imageAsset.toString(),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          title.toString(),
          style: TextStyle(fontSize: 16, color: textPrimaryColor),
        ),
      ],
    );
  }
}
