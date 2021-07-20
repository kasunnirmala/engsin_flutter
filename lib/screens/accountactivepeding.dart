import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountActivePending extends StatefulWidget {
  const AccountActivePending({Key? key}) : super(key: key);

  @override
  _AccountActivePendingState createState() => _AccountActivePendingState();
}

class _AccountActivePendingState extends State<AccountActivePending> {
  @override
  void initState() {
    super.initState();
    Resources.appbartitleStream.add("Activation Pending");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bground.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            "Account Activation Processing",
            style: kH1HeaderStyle,
            textAlign: TextAlign.center,
          ))),
          Expanded(
              child: Column(
            children: [
              Text(
                "Pending",
                style: kPendingStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                "24h",
                style: kH4HeaderStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                FontAwesomeIcons.history,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              // RoundedButton(
              //     text: "Finish",
              //     press: () {
              //       AutoRouter.of(context).replaceAll([HomeScreenRoute()]);
              //     })
            ],
          ))
        ],
      ),
    );
  }
}
