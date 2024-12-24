import 'package:flutter/material.dart';
import 'package:note_app/layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness:Brightness.light,
        ),
        home: const HomeLayout(),
    );
        
  }
}