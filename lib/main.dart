import 'package:flutter/material.dart';
import 'package:temp_app/home.dart';
import 'package:temp_app/quizpage.dart';
import 'package:temp_app/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        Home.routeName: (context) => const Home(),
        Quiz.routeName: (context) => const Quiz(),
        ResultPage.routeName: (context) => const ResultPage(),
      },
    );
  }
}
