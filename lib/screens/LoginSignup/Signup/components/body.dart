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
import 'package:flutter_svg/svg.dart';

import 'background.dart';

class Body extends StatelessWidget {
  late String _txtEmail;
  late String _txtRetypePassword;
  late String _txtPassword;
  late UserService _userService;
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
              hintText: "Email",
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
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                // AutoRouter.of(context).replace(HomeBaseRoute());
                if (_txtEmail.isNotEmpty &&
                    _txtPassword.isNotEmpty &&
                    _txtRetypePassword.isNotEmpty &&
                    _txtPassword == _txtRetypePassword)
                  EasyLoading.show(status: "Registering");
                var resp = await _userService.register(_txtEmail, _txtPassword);
                EasyLoading.dismiss();
                if (resp["status"]) {
                  Resources.getSuccessToast(
                      "Successfully Registered. Please log and enter details.");
                  AutoRouter.of(context).replace(LoginScreenRoute());
                } else {
                  Resources.getErrorToast(resp["message"]);
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
