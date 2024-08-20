import 'package:flutter/material.dart';
import 'package:news_app/bottomnavigation/bottom_navigation.dart';

import 'Screens/home_screen.dart';

void main(){
  runApp(
    const MaterialApp(
      home: BottomNavigation(),
      debugShowCheckedModeBanner: false,
    ),
  );
}