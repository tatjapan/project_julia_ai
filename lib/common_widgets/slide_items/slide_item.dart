import 'package:flutter/material.dart';
import 'package:project_julia_ai/model/slider.dart';
import 'package:project_julia_ai/values/colors.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 218,
              height: 218,
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(51, 0, 0, 0),
                borderRadius: BorderRadius.all(Radius.circular(109)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 188,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(51, 0, 0, 0),
                        borderRadius: BorderRadius.all(Radius.circular(94)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    right: 5,
                    child: Image.asset(
                      sliderArrayList[index].sliderImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
//
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                sliderArrayList[index].sliderHeading,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                  letterSpacing: 0.60714,
                  height: 1.17647,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                sliderArrayList[index].sliderSubHeading,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: -0.41,
                  height: 1.29412,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
