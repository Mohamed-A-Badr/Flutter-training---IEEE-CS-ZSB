import "package:flutter/material.dart";
import 'package:ieee_app/palm.dart';
import 'Ficus.dart';
import 'dracaena.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0 ,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Status",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Ficus",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Palm",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Dracaena",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children:[
            TabBarView(
              children: [
                Ficus(),
                Palm(),
                Dracaena(),
              ],
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(30.0),
                    )
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                alignment: Alignment.center,
                width: 250.0,
                height: 100.0,
                child: const Text(
                  "TAKE CARE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30.0,
              left: 30.0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 50.0,
                ),
                onPressed: ()=>{print("Icon Pressed")},
              ),
            ),
          ]
        ),
      ),
    );
  }
}