// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

import 'package:auto_route/annotations.dart';
import 'package:engsinapp_flutter/screens/LoginSignup/Login/login_screen.dart';
import 'package:engsinapp_flutter/screens/LoginSignup/Signup/signup_screen.dart';
import 'package:engsinapp_flutter/screens/LoginSignup/Welcome/welcome_screen.dart';
import 'package:engsinapp_flutter/screens/about.dart';
import 'package:engsinapp_flutter/screens/accountactivepeding.dart';
import 'package:engsinapp_flutter/screens/balance.dart';
import 'package:engsinapp_flutter/screens/bank.dart';
import 'package:engsinapp_flutter/screens/daylist.dart';
import 'package:engsinapp_flutter/screens/enterDetails.dart';
import 'package:engsinapp_flutter/screens/help_center.dart';
import 'package:engsinapp_flutter/screens/home.dart';
import 'package:engsinapp_flutter/screens/home_base.dart';
import 'package:engsinapp_flutter/screens/loading.dart';
import 'package:engsinapp_flutter/screens/notification.dart';
import 'package:engsinapp_flutter/screens/profile.dart';
import 'package:engsinapp_flutter/screens/referrals.dart';
import 'package:engsinapp_flutter/screens/singleDay.dart';
import 'package:engsinapp_flutter/screens/termsAndConditions.dart';
import 'package:engsinapp_flutter/screens/enterBankDetails.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // AutoRoute(page: LoadingScreen, path: '/loading'),
    AutoRoute(page: LoadingScreen, initial: true),
    AutoRoute(page: LoginScreen, path: '/login'),
    AutoRoute(page: SignUpScreen, path: '/signup'),
    AutoRoute(page: WelcomeScreen, path: '/welcome'),
    // AutoRoute(page: UploadSlipScreen, initial: true),
    AutoRoute(page: HomeBase, path: '/home_base', children: <AutoRoute>[
      AutoRoute(page: HomeScreen, initial: true),
      AutoRoute(page: ProfileScreen, path: 'profile'),
      AutoRoute(page: EnterDetailsScreen, path: 'enterDetails'),
      AutoRoute(page: EnterBankDetaillScreen, path: 'enterBankDetails'),
      AutoRoute(page: AccountActivePending, path: 'activation'),
      AutoRoute(page: NotificationScreen, path: 'notifications'),
      AutoRoute(page: AboutScreen, path: 'about'),
      AutoRoute(page: BankScreen, path: 'bank'),
      AutoRoute(page: SingleDayScreen, path: 'singleDay'),
      AutoRoute(page: DayListScreen, path: 'daylist'),
      AutoRoute(page: BalanceScreen, path: 'balance'),
      AutoRoute(page: ReferalsScreen, path: 'referals'),
      AutoRoute(page: HelpCenterScreen, path: 'helpCenter'),
      AutoRoute(page: TermsAndConditionsScreen, path: 'termsAndConditions'),
    ]),
  ],
)
class $AppRouter {}
