import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Ficus extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Image(
                  image: NetworkImage(
                    "https://www.pngkey.com/png/full/779-7797343_ficus-audrey-large-rubber-plant-ficus-houseplants-fig.png",
                  ),
                  width: 220.0,
                  height: 400.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Container(
                  child: CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 5.0,
                    percent: 60/100,
                    animation: true,
                    animationDuration: 1500,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "60%",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0
                          ),
                        ),
                        Text(
                          "Food",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top:75.0),
                  child: CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 5.0,
                    percent: 75/100,
                    animation: true,
                    animationDuration: 1500,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "75%",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0
                          ),
                        ),
                        Text(
                          "Light",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top:75.0),
                  child: CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 5.0,
                    percent: 40/100,
                    animation: true,
                    animationDuration: 1500,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "40%",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0
                          ),
                        ),
                        Text(
                          "Water",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}