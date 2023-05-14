import 'package:electricity_bill_calculator/add_fund_page.dart';
import 'package:electricity_bill_calculator/constants.dart';
import 'package:electricity_bill_calculator/electricity_bill_page.dart';
import 'package:electricity_bill_calculator/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 16,
            ),
            _buildProfile(context),
            const SizedBox(
              height: 64,
            ),
            _buildFunctionalButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.black,
                size: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(AppConstants.customerId),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("So du: ${currentFund}d")
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddFundPage(),
              ));
            },
            child: const Text("Nap tien"),
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionalButtons(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildFunctionalButton(Icons.water, "Tien nuoc"),
        _buildFunctionalButton(
          Icons.electric_bolt,
          "Tien dien",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ElectricityBillPage(),
            ));
          },
        ),
        _buildFunctionalButton(Icons.history_edu, "Tien hoc phi"),
      ],
    );
  }

  Widget _buildFunctionalButton(IconData icon, String text,
      {VoidCallback? onPressed}) {
    return Center(
      child: Column(
        children: [
          IconButton(onPressed: onPressed, icon: Icon(icon)),
          Text(text),
        ],
      ),
    );
  }
}
