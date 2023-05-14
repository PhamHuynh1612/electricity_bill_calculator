import 'package:electricity_bill_calculator/home_page.dart';
import 'package:electricity_bill_calculator/main.dart';
import 'package:flutter/material.dart';

class AddFundPage extends StatefulWidget {
  const AddFundPage({Key? key}) : super(key: key);

  @override
  State<AddFundPage> createState() => _AddFundPageState();
}

class _AddFundPageState extends State<AddFundPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Nap tien vao tai khoan"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              _buildFundInfo(),
              SizedBox(
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

  Widget _buildFundInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "So du: ",
        ),
        Text(
          "${currentFund}d",
          style: TextStyle(
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
      controller: textEditingController,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildAddFundButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: _validateForm,
        child: Text("Nap tien"),
      ),
    );
  }

  void _validateForm() {
    if (textEditingController.text.trim().isEmpty) {
      _showErrorDialog("So tien khong duoc de trong");
      return;
    }

    if (double.tryParse(textEditingController.text.trim()) == null) {
      _showErrorDialog("So tien khong hop le");
      return;
    }
    _addFund();
  }

  void _addFund() {
    currentFund += num.parse(textEditingController.text.trim());
    _backToHomeScreen();
  }

  void _backToHomeScreen() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false);
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(title: Text(errorMessage)),
    );
  }
}
