import "package:flutter/material.dart";
import 'package:percent_indicator/circular_percent_indicator.dart';

class Dracaena extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Image(
                  image: NetworkImage(
                    "https://www.pngitem.com/pimgs/m/521-5210231_yucca-elephantipes-palme-60-30-20-dracaena-lemon.png",
                  ),
                  width: 250.0,
                  height: 450.0,
                  fit: BoxFit.cover,
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
                    percent: 30/100,
                    animation: true,
                    animationDuration: 1500,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "30%",
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
                    percent: 50/100,
                    animation: true,
                    animationDuration: 1500,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "50%",
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
                    percent: 25/100,
                    animation: true,
                    animationDuration: 1500,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "25%",
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