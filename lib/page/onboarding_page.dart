import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/images.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
    } else {
      // Navigate to login page
      Get.offNamed('/login');
    }
  }
}

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () => IndexedStack(
                index: controller.currentPage.value,
                children: const [
                  OnboardingPage(
                    title: '',
                    description: 'SUDANESE PRODUCTS!', imageUrl:onBoarding1,
                  ),
                  OnboardingPage(
                    title: 'Page 2',
                    description: 'Welcome to Page 2!', imageUrl:onBoarding2,
                  ),
                  OnboardingPage(
                    title: 'Page 3',
                    description: 'Welcome to Page 3!', imageUrl: onBoarding3,
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                controller.nextPage();
              },
              child: Obx(() {
                if (controller.currentPage.value < 2) {
                  return const Text('Next');
                } else {
                  return const Text('Continue to Login');
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}


class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl; // Add imageUrl for the network image

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
        children: [

          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.width,
          ),
        Positioned(
          bottom: 1,
          left: 0,
          right: 40,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 40),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

