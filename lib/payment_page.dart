import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/home_page.dart';
import 'package:electricity_bill_calculator/main.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key, required this.customerId}) : super(key: key);
  final String customerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Xac nhan giao dich",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: [
            const Text("Tai khoan cua ban: "),
            const SizedBox(
              height: 8,
            ),
            _buildCustomerInfo(),
            const SizedBox(
              height: 16,
            ),
            const Divider(height: 2, color: Colors.black),
            const SizedBox(
              height: 16,
            ),
            _buildBillInfo(),
          ],
        ),
      ),
      bottomNavigationBar: _buildPayButton(context),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        child: const Text("Thanh toan"),
        onPressed: () {
          _validateTransaction(context);
        },
      ),
    );
  }

  void _validateTransaction(BuildContext context) {
    if (currentFund < (AppConstants.paymentFee + AppConstants.paymentAmount)) {
      _showErrorDialog(
          "Ban khong du tien de thuc hien giao dich nay!", context);
      return;
    }
    _doTransaction();
    _backToHomeScreen(context);
  }

  void _doTransaction() {
    currentFund -= (AppConstants.paymentFee + AppConstants.paymentAmount);
  }

  void _backToHomeScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false);
  }

  void _showErrorDialog(String errorMessage, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(errorMessage)),
    );
  }

  Widget _buildCustomerInfo() {
    return Row(
      children: [
        const Icon(
          Icons.money,
          size: 64,
          color: Colors.black,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Viettel Pay",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${currentFund}d",
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBillInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Thong tin giao dich",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        _buildBillInfoRow("Ma khach hang", customerId),
        const SizedBox(
          height: 8,
        ),
        const Divider(height: 2, color: Colors.black),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "So tien giao dich",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildBillInfoRow("So tien giao dich", "20.000"),
        const SizedBox(
          height: 8,
        ),
        _buildBillInfoRow("Phi giao dich", "Mien phi"),
      ],
    );
  }

  Widget _buildBillInfoRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText),
        Text(
          rightText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
