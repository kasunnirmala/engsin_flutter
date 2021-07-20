import 'package:auto_route/auto_route.dart';
import 'package:engsinapp_flutter/models/user.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:engsinapp_flutter/route/appRouter.gr.dart';
import 'package:engsinapp_flutter/screens/help_center.dart';
import 'package:engsinapp_flutter/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserService _userService;
  late UserModel? user;
  @override
  void initState() {
    _userService = UserService(context);
    getProfile();
    super.initState();
    Resources.appbartitleStream.add("Home");
  }

  getProfile() async {
    EasyLoading.show(status: "Getting Details. Please wait...");
    user = await _userService.getUser();
    EasyLoading.dismiss();

    if (user == null) {
      await _userService.onUserFetchError();
      AutoRouter.of(context).root.popUntilRoot();
    } else {
      setState(() {
        Resources.userModel = user!;
      });
      if (user!.isDetailsAdded) {
        if (!user!.isActive) {
          AutoRouter.of(context).replace(AccountActivePendingRoute());
        }
      } else {
        AutoRouter.of(context).replace(EnterDetailsScreenRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              child: ClipPath(
                clipper:
                    CustomShape(), // this is my own class which extendsCustomClipper
                child: Container(
                  color: kPrimaryColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "A MESSAGE TO DISPLAY",
                          style: kH2HeaderStyle,
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          child: Image.asset(
                            "assets/images/logo.png",
                            // width: 150,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Container(
                child: Column(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Container(
                                child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: _MenuItemTile(
                                            icon: FontAwesomeIcons.book,
                                            title: "Learning",
                                            onPressed: () {
                                              AutoRouter.of(context)
                                                  .push(DayListScreenRoute());
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.userTie,
                                          title: "Profile",
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(ProfileScreenRoute());
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.bell,
                                          title: "Notifications",
                                          onPressed: () {
                                            AutoRouter.of(context).push(
                                                NotificationScreenRoute());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.dollarSign,
                                          title: "Balance",
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(BalanceScreenRoute());
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.users,
                                          title: "Referrals",
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(ReferalsScreenRoute());
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.infoCircle,
                                          title: "About",
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(AboutScreenRoute());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.university,
                                          title: "Bank",
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(BankScreenRoute());
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.searchengin,
                                          title: "Help Center",
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(HelpCenterScreenRoute());
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: _MenuItemTile(
                                          icon: FontAwesomeIcons.bahai,
                                          title: "T&C",
                                          onPressed: () {
                                            AutoRouter.of(context).push(
                                                TermsAndConditionsScreenRoute());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: kPrimaryColor,
                child: Center(
                  child: Text("All Right Reserved"),
                ),
              ))
        ],
      ),
    );
  }
}

class _MenuItemTile extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  const _MenuItemTile(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: MaterialButton(
          onPressed: onPressed,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(
                  height: 10,
                ),
                Text(title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double itemHeight = height * 0.5;
    double width = size.width;
    var path = Path();
    path.lineTo(0, itemHeight);
    path.quadraticBezierTo(width / 2, height, width, itemHeight);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
