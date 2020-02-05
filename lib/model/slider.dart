import 'package:flutter/material.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider({
    @required this.sliderImageUrl,
    @required this.sliderHeading,
    @required this.sliderSubHeading,
  });
}

final sliderArrayList = [
  Slider(
    sliderImageUrl: "assets/images/slider_image1.png",
    sliderHeading: "For All Travelers",
    sliderSubHeading:
        "who want a unique experience that surpasses typical travel plans",
  ),
  Slider(
    sliderImageUrl: "assets/images/slider_image2.png",
    sliderHeading: "Ask me about anything.",
    sliderSubHeading:
        "Do you want to know about nearby hidden neighborhoods where visitors rarely go, or perhaps where to get a bite to eat?",
  ),
  Slider(
    sliderImageUrl: "assets/images/slider_image3.png",
    sliderHeading: "Interact with cool local culture.",
    sliderSubHeading:
        "Your favorite local AI guide will take you out to great bars in up-and-coming neighborhoods, or down to the best underground music spots.",
  ),
  Slider(
    sliderImageUrl: "assets/images/slider_image4.png",
    sliderHeading: "We’re having fun!!",
    sliderSubHeading: "Enjoy sharing your time with new friends!",
  ),
];
