import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/already_have_an_account_acheck.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_button.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_input_field.dart';
import 'package:engsinapp_flutter/widgets/LoginSignup/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String _txtEmail;

  late String _txtRetypePassword;

  late String _txtPassword;
  bool checked = false;
  late UserService _userService;

  onCheckChange(val) {
    setState(() {
      checked = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _userService = UserService(context);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {
                _txtEmail = value;
              },
            ),
            RoundedPasswordField(
              hint: "Password",
              onChanged: (value) {
                _txtPassword = value;
              },
            ),
            RoundedPasswordField(
              hint: "Re-type Password",
              onChanged: (value) {
                _txtRetypePassword = value;
              },
            ),
            FormBuilderCheckbox(
              name: 'accept_terms',
              initialValue: false,
              onChanged: onCheckChange,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I have read and agree to the ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Privacy policies and Terms and Conditions',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                if (!checked) {
                  Resources.getErrorToast("Please accept terms and conditions");
                  return;
                }
                if (_txtEmail.isNotEmpty &&
                    _txtPassword.isNotEmpty &&
                    _txtRetypePassword.isNotEmpty &&
                    _txtPassword == _txtRetypePassword) {
                  EasyLoading.show(status: "Registering");
                  var resp =
                      await _userService.register(_txtEmail, _txtPassword);
                  EasyLoading.dismiss();
                  if (resp["status"]) {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            content:
                                Text("Registration Conpleted Successfully"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    AutoRouter.of(context).pop();
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        });
                    Resources.getSuccessToast(
                        "Successfully Registered. Please log and enter details.");
                    AutoRouter.of(context).replace(LoginScreenRoute());
                  } else {
                    Resources.getErrorToast(resp["message"]);
                  }
                } else {
                  Resources.getErrorToast("Please fill all the details");
                  return;
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                AutoRouter.of(context).push(LoginScreenRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
