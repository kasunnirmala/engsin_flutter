import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  List items = [
    ["5,000", "Pending"],
    ["5,000", "Paid"],
    ["5,000", "Paid"],
    ["6,000", "Paid"]
  ];
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Balance");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Balance",
                    style: kH1HeaderStyle,
                  ),
                ),
                Expanded(
                    flex: 11,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return _BalanceCard(
                            size: size,
                            amount: items[index][0],
                            description: items[index][1],
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final Size size;
  final String amount;
  final String description;
  const _BalanceCard(
      {Key? key,
      required this.size,
      required this.amount,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height * 0.15,
              child: Card(
                  color: kSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "රු. $amount",
                          style: kH1HeaderStyle,
                        ),
                        Text(
                          "$description",
                          style: kH3HeaderStyle,
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
