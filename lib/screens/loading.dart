import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late UserService _userService;
  void loaded() async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      await checkSession();
    });
  }

  checkSession() async {
    bool userSession = await _userService.checkSession();
    print(userSession);
    if (userSession) {
      AutoRouter.of(context).replace(HomeBaseRoute());
    } else {
      AutoRouter.of(context).replace(LoginScreenRoute());
    }
    // AutoRouter.of(context).replace(LoginScreenRoute());
  }

  @override
  void initState() {
    super.initState();
    _userService = UserService(context);
    loaded();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.blue[100],
      )),
    );
  }
}
