import 'package:flutter/material.dart';
import 'package:gitjobs/Home.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.white)))));
}
