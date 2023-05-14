import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/home_page.dart';
import 'package:flutter/material.dart';

num currentFund = AppConstants.initialFund;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
