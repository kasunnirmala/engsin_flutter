import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:flutter/material.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  _BankScreenState createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Bank");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
                child: _BankCard(
              size: size,
              title: "Your Bank",
              accountNumber: "234324",
              bank: "BOC",
              branch: "Galle City",
              name: "Kasun Nirmala",
            )),
            Expanded(
                child: _BankCard(
              size: size,
              title: "Our Bank",
              accountNumber: "123123435345",
              bank: "Commercial Bank",
              branch: "Galle",
              name: "BGK Nirmala",
            )),
          ],
        ));
  }
}

class _BankCard extends StatelessWidget {
  final Size size;
  final String name;
  final String accountNumber;
  final String bank;
  final String branch;
  final String title;
  const _BankCard(
      {Key? key,
      required this.size,
      required this.accountNumber,
      required this.bank,
      required this.branch,
      required this.title,
      required this.name})
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
            Text(
              "$title",
              style: kH1HeaderStyle,
            ),
            SizedBox(height: 10),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.25,
              child: Card(
                  color: kSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text(
                                "Account Holder Name",
                                style: kNormalBoldStyle,
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(": $name", style: kNormalStyle),
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text(
                                "Account Number",
                                style: kNormalBoldStyle,
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child:
                                  Text(": $accountNumber", style: kNormalStyle),
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text(
                                "Bank",
                                style: kNormalBoldStyle,
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(": $bank", style: kNormalStyle),
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text(
                                "Branch",
                                style: kNormalBoldStyle,
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Text(": $branch", style: kNormalStyle),
                            ))
                          ],
                        )),
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
