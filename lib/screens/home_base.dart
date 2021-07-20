import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/screens/loading.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:engsinapp_flutter/widgets/get_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upgrader/upgrader.dart';

class HomeBase extends StatefulWidget {
  @override
  _HomeBaseState createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {
  late UserService _userService;
  @override
  void initState() {
    _userService = UserService(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double sysHeight = MediaQuery.of(context).size.height;
    // double sysWidth = MediaQuery.of(context).size.width;
    final cfg =
        AppcastConfiguration(url: APPCAST_URL, supportedOS: ['android']);
    return FlutterEasyLoading(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: AutoRouter.of(context).canPopSelfOrChildren
                ? IconButton(
                    onPressed: () {
                      AutoRouter.of(context).popTop();
                    },
                    icon: Icon(FontAwesomeIcons.arrowCircleLeft))
                : null,
            backgroundColor: kPrimaryColor,
            title: StreamBuilder<String>(
                stream: Resources.appbartitleStream.stream,
                initialData: "Home",
                builder: (context, snapshot) {
                  return Text(snapshot.data ?? "");
                }),
            actions: [
              IconButton(
                  onPressed: () async {
                    // AutoRouter.of(context).replace(LoadingScreenRoute());
                    await _userService.onUserFetchError();
                  },
                  icon: Icon(FontAwesomeIcons.signOutAlt))
            ],
          ),
          backgroundColor: kMainBGColor,
          body: UpgradeAlert(
              canDismissDialog: false,
              showIgnore: false,
              showLater: false,
              appcastConfig: cfg,
              debugLogging: true,
              child: AutoRouter()),
        ),
      ),
    );
  }
}
