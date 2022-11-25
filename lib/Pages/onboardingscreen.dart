
import 'package:lottie/lottie.dart';

import '../models/onboarding.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
     onboardingData(
      title: "Represent a country",
      subtitle: "Represent your country in the world's largest student-run simulation of the United Nations.",
      image:  LottieBuilder.network('https://assets10.lottiefiles.com/packages/lf20_keoed4f6.json'),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(71, 59, 117, 1),
              Color.fromRGBO(71, 59, 117, 1),
            ],
          ),
        ),
      ),
    ),
    onboardingData(
      title: "learn",
      subtitle:
          "Interact with lots of people daily and gain knowledge from them",
      image: LottieBuilder.network('https://assets3.lottiefiles.com/packages/lf20_n9n3ubhv.json'),
      backgroundColor: Colors.white,
      titleColor: Colors.pink,
      subtitleColor: Colors.red,
      background: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 10, 56, 1),
              Color.fromRGBO(0, 10, 56, 1),
            ],
          ),
        ),
      ),
    ),
    onboardingData(
      title: "Argue",
      subtitle: "Argue with people and get to know their point of view",
      image: LottieBuilder.network('https://assets2.lottiefiles.com/packages/lf20_VAcXFj87ku.json'),
      backgroundColor: Colors.blueAccent,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ),
      ),
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return onboarding(data: data[index]);
        },
        onFinish: () {
          Navigator.of(context).pushReplacementNamed("/home");
        },
      ),
    );
  }
}