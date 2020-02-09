import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_julia_ai/model/slider.dart';
import 'package:project_julia_ai/common_widgets/slide_items/slide_dots.dart';
import 'package:project_julia_ai/common_widgets/slide_items/slide_item.dart';

class OnBoardingLayoutView extends StatefulWidget {
  @override
  _OnBoardingLayoutViewState createState() => _OnBoardingLayoutViewState();
}

class _OnBoardingLayoutViewState extends State<OnBoardingLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageCanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => sliderLayout();

//  bool inFinalPage() {
//    if (_currentPage == sliderArrayList.length - 1) {
//      return true;
//    }
//    return false;
//  }

  Widget sliderLayout() => Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageCanged,
                itemCount: sliderArrayList.length,
                itemBuilder: (ctx, i) => SlideItem(i),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(
                top: 25.0,
                bottom: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < sliderArrayList.length; i++)
                    if (i == _currentPage) SlideDots(true) else SlideDots(false)
                ],
              ),
            ),
          ],
        ),
      );
}
