import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sd_shop/utils/images.dart';

import '../../../utils/color.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    super.key,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final List<String> images = [
    slider1,
    slider2,
    slider3,
  ];
  var titles = [
    "hello",
    "hello2",
    "hello3",
  ];

  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            white, // Start with a transparent color
                            primaryColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Image.asset(images[index])),
                  Positioned(
                      bottom: 40.0,
                      right: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${titles[index]}",
                            style: TextStyle(
                                fontSize: 18,
                                color: white,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 16.0,
                    left: 0,
                    right: 0,
                    child: DotsIndicator(
                      dotsCount: titles.isNotEmpty ? titles.length : 1,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        color: Colors.white,
                        activeColor: primaryColor,
                        size: const Size.square(5.0),
                        activeSize: const Size(20.0, 6.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
