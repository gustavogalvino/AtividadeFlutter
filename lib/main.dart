import 'package:flutter/material.dart';
import 'package:ac03/home.dart';


void main() {
  runApp(MaterialApp(
    title: 'AC03',
    theme: ThemeData(
        primarySwatch: Colors.indigo
    ),
    home: Home(),
    debugShowCheckedModeBanner: false,
  )
  );
}