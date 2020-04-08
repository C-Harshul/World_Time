import 'package:flutter/material.dart';
import 'package:worldtime/Pages/choose_location.dart';
import 'Pages/home.dart';
import 'Pages/Loading.dart';
void main() {
  runApp(MaterialApp(
    //initialRoute: '/',
    routes:{
     '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
   )
  );
}

