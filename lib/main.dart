import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

num currentFund = AppConstants.initialFund;
late SharedPreferences sharedPreference;

void addFund(int amount) async {
  await sharedPreference.setInt("current_fund", currentFund.toInt() + amount);
}

void removeFund(int amount) async {
  await sharedPreference.setInt("current_fund", currentFund.toInt() - amount);
}

int getCurrentFund()  {
  return currentFund = sharedPreference.getInt("current_fund") ?? 0;
}

void updateFund() async {
  await sharedPreference.setInt("current_fund", currentFund.toInt());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreference = await SharedPreferences.getInstance();
  currentFund = getCurrentFund();
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
