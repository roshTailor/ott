import 'package:flutter/material.dart';
import 'package:ott/site.dart';
import 'homePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/':(context) => const HomePage(),
        'site':(context) => const Site()
      }
    ),
  );
}
