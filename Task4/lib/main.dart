import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app/layout/home_screen.dart';
import 'package:ieee_app/shared/bloc_observer.dart';
void main(){
  BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: MyBlocObserver(),
  );

}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeLayout(),
    );
  }

}