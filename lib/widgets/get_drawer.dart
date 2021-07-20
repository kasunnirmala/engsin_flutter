import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetDrawer {
  static final GetDrawer _getDrawer = GetDrawer._internal();
  factory GetDrawer() {
    return _getDrawer;
  }

  GetDrawer._internal();

  Widget get(BuildContext context) {
    double sysHeight = MediaQuery.of(context).size.height;
    return Column(
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
                  leading: Icon(FontAwesomeIcons.home),
                  title: Text("Home"),
                  onTap: () async {
                    AutoRouter.of(context).pop();
                    // await _userService.onUserFetchError();
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Divider(),
                ),

                ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt),
                  title: Text("Logout"),
                  onTap: () async {
                    AutoRouter.of(context).replace(LoadingScreenRoute());
                    // await _userService.onUserFetchError();
                  },
                ),
              ],
            )),
      ],
    );
  }
}
