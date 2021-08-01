import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GetDrawer {
  static final GetDrawer _getDrawer = GetDrawer._internal();

  factory GetDrawer() {
    return _getDrawer;
  }

  GetDrawer._internal();

  Widget get(BuildContext context) {
    Size sysSize = MediaQuery.of(context).size;
    UserService _userService = UserService(context);
    return Container(
      color: kPrimaryVeryLightColor,
      width: sysSize.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(),
            ),
          ),
          Expanded(
              flex: 5,
              // width: sysWidth * 0.4,
              child: Column(
                children: [
                  // ListTile(
                  //     leading: Icon(FontAwesomeIcons.userAlt),
                  //     title: Text("My Profile"),
                  //     onTap: () {
                  //       if (Resources.drawerKey.currentState.isDrawerOpen) {
                  //         ExtendedNavigator.named('Base').pop();
                  //       }
                  //       ExtendedNavigator.named('Body').push(HomeBaseRoutes.myProfileScreen);
                  //     },
                  //   ),
                  //   FutureBuilder<bool>(
                  //       initialData: false,
                  //       future: connectionChecker.checkConnection(),
                  //       builder: (context, snapshot) {
                  //         return snapshot.hasData
                  //             ? !(Resources.user == null ? true : ((Resources.user.isApple || Resources.user.isFacebook || Resources.user.isGoogle) && !Resources.user.hasPassword))
                  //                 ? ListTile(
                  //                     leading: Icon(FontAwesomeIcons.key),
                  //                     title: Text("Change Password"),
                  //                     onTap: () {
                  //                       if (Resources.drawerKey.currentState.isDrawerOpen) {
                  //                         ExtendedNavigator.named('Base').pop();
                  //                       }
                  //                       ExtendedNavigator.named('Body').push(HomeBaseRoutes.changePassword);
                  //                       // Resources.navigationKey.currentState
                  //                       //     .pushNamed('/change-password');
                  //                     },
                  //                   )
                  //                 : Container()
                  //             : Container();
                  //       }),

                  ListTile(
                    leading: Icon(FontAwesomeIcons.signOutAlt),
                    title: Text("Logout"),
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              content: Text("Do you want to logout?"),
                              actions: [
                                DialogButton(
                                    child: Text("Yes"),
                                    onPressed: () async {
                                      AutoRouter.of(context)
                                          .replace(LoadingScreenRoute());
                                      await _userService.onUserFetchError();
                                    }),
                                DialogButton(
                                    child: Text("No"),
                                    onPressed: () {
                                      AutoRouter.of(context).pop();
                                    })
                              ],
                            );
                          });
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
