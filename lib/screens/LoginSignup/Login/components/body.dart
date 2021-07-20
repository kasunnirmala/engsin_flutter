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
  String? _txtUsername;
  String? _txtPassword;
  late UserService _userService;

  @override
  Widget build(BuildContext context) {
    _userService = UserService(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {
                _txtUsername = value;
              },
            ),
            RoundedPasswordField(
              hint: "Password",
              onChanged: (value) {
                _txtPassword = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if (_txtPassword != null && _txtUsername != null) {
                  EasyLoading.show(status: "Loging in...!");
                  var resp =
                      await _userService.login(_txtUsername!, _txtPassword!);
                  EasyLoading.dismiss();
                  if (resp["status"]) {
                    Resources.getSuccessToast(resp["message"]);
                    AutoRouter.of(context).replace(HomeBaseRoute());
                  } else {
                    Resources.getErrorToast(resp["message"]);
                  }
                } else {
                  Resources.getErrorToast("Please fill details");
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                AutoRouter.of(context).push(SignUpScreenRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
