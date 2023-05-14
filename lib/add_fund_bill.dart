import 'dart:ffi';

import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_page.dart';

class AddFundBillPage extends StatelessWidget {
  const AddFundBillPage(
      {Key? key, required this.amount, required this.bankName})
      : super(key: key);
  final int amount;
  final String bankName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Xac nhan nap tien",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ten ngan hang"),
                  Text(bankName),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ten khach hang"),
                  Text(AppConstants.customerId),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("So tien"),
                  Text(amount.toString()),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phi giao dich"),
                  Text("Mien phi"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            child: const Text("Xac nhan"),
            onPressed: () => _addFund(context),
          ),
        ),
      ),
    );
  }

  void _addFund(BuildContext context) {
    currentFund += amount;
    updateFund();
    _backToHomeScreen(context);
    Fluttertoast.showToast(msg: "Giao dich thanh cong!");
  }

  void _backToHomeScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false);
  }
}
