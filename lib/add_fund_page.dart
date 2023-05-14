import 'package:electricity_bill_calculator/add_fund_bill.dart';
import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/home_page.dart';
import 'package:electricity_bill_calculator/main.dart';
import 'package:flutter/material.dart';

class AddFundPage extends StatefulWidget {
  const AddFundPage({Key? key}) : super(key: key);

  @override
  State<AddFundPage> createState() => _AddFundPageState();
}

class _AddFundPageState extends State<AddFundPage> {
  final TextEditingController addFundAmountInputController =
      TextEditingController();
  final TextEditingController bankAccountInputController =
      TextEditingController();
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text("Nap tien vao tai khoan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              _buildFundInfo(),
              const SizedBox(
                height: 16,
              ),
              _buildDropdownMenu(),
              const SizedBox(
                height: 16,
              ),
              _buildBankAccountNumberInput(),
              const SizedBox(
                height: 16,
              ),
              _buildAddFundTextField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildAddFundButton(),
    );
  }

  Widget _buildDropdownMenu() {
    return DropdownButton(
      isExpanded: true,
      value: selectedBank,
      hint: const Text("Chon ngan hang"),
      items: AppConstants.bankNames
          .map((e) => _buildDropdownMenuItem(bankName: e))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedBank = value;
        });
      },
    );
  }

  DropdownMenuItem _buildDropdownMenuItem({required String bankName}) {
    return DropdownMenuItem(
      value: bankName,
      child: Text(bankName),
    );
  }

  Widget _buildFundInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "So du: ",
        ),
        Text(
          "${currentFund}d",
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildAddFundTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Nhap so tien muon nap",
      ),
      controller: addFundAmountInputController,

      /// Thay doi kieu ban phim o day
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildBankAccountNumberInput() {
    return Visibility(
      visible: selectedBank != null,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Nhap so tai khoan",
        ),
        controller: bankAccountInputController,
      ),
    );
  }

  Widget _buildAddFundButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: _validateForm,
        child: const Text("Nap tien"),
      ),
    );
  }

  void _validateForm() {
    if (selectedBank == null) {
      _showErrorDialog("Ban chua chon ngan hang");
      return;
    }

    if (bankAccountInputController.text.trim().isEmpty) {
      _showErrorDialog("Ban chua nhap so tai khoan");
      return;
    }

    if (addFundAmountInputController.text.trim().isEmpty) {
      _showErrorDialog("So tien khong duoc de trong");
      return;
    }

    if (double.tryParse(addFundAmountInputController.text.trim()) == null ||
        double.tryParse(addFundAmountInputController.text.trim())! <= 0) {
      _showErrorDialog("So tien khong hop le");
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  AddFundBillPage(amount: int.parse(addFundAmountInputController.text), bankName: selectedBank!),
    ));
  }



  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(errorMessage)),
    );
  }
}
