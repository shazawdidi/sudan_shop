import 'package:flutter/material.dart';


class TrendingItem extends StatelessWidget {
  final String? imageAsset;
  final String? title;

  const TrendingItem({super.key,
    required this.imageAsset,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
       margin: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageAsset.toString(),
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            color: Colors.black54,
            child: Text(
              title.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
