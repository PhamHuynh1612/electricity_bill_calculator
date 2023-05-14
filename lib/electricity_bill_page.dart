import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/payment_page.dart';
import 'package:flutter/material.dart';

class ElectricityBillPage extends StatefulWidget {
  const ElectricityBillPage({Key? key}) : super(key: key);

  @override
  State<ElectricityBillPage> createState() => _ElectricityBillPageState();
}

class _ElectricityBillPageState extends State<ElectricityBillPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Tien dien"),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          children: [
            _buildInfoBanner(),
            const SizedBox(
              height: 16,
            ),
            _buildCustomerIdInput(),
            const SizedBox(
              height: 16,
            ),
            _buildPaymentButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Row(
      children: [
        Icon(
          Icons.electric_bolt,
          size: 64,
          color: Colors.black,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Don vi phat hanh"),
            Text("Tap doan dien luc Viet Nam EVN"),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomerIdInput() {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: "Ma khach hang",
      ),
    );
  }

  Widget _buildPaymentButton() {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
      child: ElevatedButton(
        onPressed: _validateCustomerId,
        child: const Text("Thanh toan"),
      ),
    );
  }

  void _validateCustomerId() {
    if (textEditingController.text.trim().isEmpty) {
      _showErrorDialog("Ten khach hang khong duoc de trong!");
      return;
    }
    if (textEditingController.text.trim() != AppConstants.customerId) {
      _showErrorDialog("Khach hang khong ton tai!");
      return;
    }
    _goToPaymentPage();
  }

  void _goToPaymentPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  PaymentPage(customerId: textEditingController.text),
    ));
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(errorMessage)),
    );
  }
}
