import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sd_shop/page/login_page.dart';
import 'package:sd_shop/utils/images.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetStorage.init(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final box = GetStorage();
          bool showOnboarding = box.read('showOnboarding') ?? true;

          if (showOnboarding) {
            return OnBoardingSlider(
              finishButtonText: 'next',
              onFinish: () {
                // Once finished, set the flag to false
                box.write('showOnboarding', false);
                Get.to(() => const LoginPage());
              },
              finishButtonStyle: const FinishButtonStyle(
                backgroundColor: Colors.brown,
              ),
              hasSkip: false,
              centerBackground: true,
              controllerColor: white,
              totalPage: 3,
              headerBackgroundColor: Colors.white,
              pageBackgroundColor: Colors.white,
              background: [
                Image.asset(
                  onBoarding1,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  onBoarding2,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  onBoarding3,
                  fit: BoxFit.fill,
                ),
              ],
              speed: 1.8,
              pageBodies: [
                Container(),
                Container(),
                Container(),
              ],
            );
          } else {
            // If onboarding is not required, navigate to login directly
            return const LoginPage();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
