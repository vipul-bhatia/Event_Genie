import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "What E-Cell is?",
    image: "assets/images/image1.png",//not is use now
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Our Vision And Goals",
    image: "assets/images/image2.png",//not in use now
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Our Commities and there heads",
    image: "assets/images/image3.png",//not in use now
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
