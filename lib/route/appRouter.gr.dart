// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/user.dart' as _i22;
import '../screens/about.dart' as _i14;
import '../screens/accountactivepeding.dart' as _i12;
import '../screens/balance.dart' as _i18;
import '../screens/bank.dart' as _i15;
import '../screens/daylist.dart' as _i17;
import '../screens/enterDetails.dart' as _i10;
import '../screens/help_center.dart' as _i20;
import '../screens/home.dart' as _i8;
import '../screens/home_base.dart' as _i7;
import '../screens/loading.dart' as _i3;
import '../screens/LoginSignup/Login/login_screen.dart' as _i4;
import '../screens/LoginSignup/Signup/signup_screen.dart' as _i5;
import '../screens/LoginSignup/Welcome/welcome_screen.dart' as _i6;
import '../screens/notification.dart' as _i13;
import '../screens/profile.dart' as _i9;
import '../screens/referrals.dart' as _i19;
import '../screens/singleDay.dart' as _i16;
import '../screens/termsAndConditions.dart' as _i21;
import '../screens/uploadSlip.dart' as _i11;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoadingScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.LoadingScreen();
        }),
    LoginScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.LoginScreen();
        }),
    SignUpScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.SignUpScreen();
        }),
    WelcomeScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.WelcomeScreen();
        }),
    HomeBaseRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.HomeBase();
        }),
    HomeScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.HomeScreen();
        }),
    ProfileScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.ProfileScreen();
        }),
    EnterDetailsScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.EnterDetailsScreen();
        }),
    UploadSlipScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<UploadSlipScreenRouteArgs>();
          return _i11.UploadSlipScreen(args.userModel);
        }),
    AccountActivePendingRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i12.AccountActivePending();
        }),
    NotificationScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i13.NotificationScreen();
        }),
    AboutScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i14.AboutScreen();
        }),
    BankScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.BankScreen();
        }),
    SingleDayScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SingleDayScreenRouteArgs>();
          return _i16.SingleDayScreen(args.title, args.meta);
        }),
    DayListScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i17.DayListScreen();
        }),
    BalanceScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i18.BalanceScreen();
        }),
    ReferalsScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i19.ReferalsScreen();
        }),
    HelpCenterScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i20.HelpCenterScreen();
        }),
    TermsAndConditionsScreenRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return const _i21.TermsAndConditionsScreen();
            })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoadingScreenRoute.name, path: '/'),
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login'),
        _i1.RouteConfig(SignUpScreenRoute.name, path: '/signup'),
        _i1.RouteConfig(WelcomeScreenRoute.name, path: '/welcome'),
        _i1.RouteConfig(HomeBaseRoute.name, path: '/home_base', children: [
          _i1.RouteConfig(HomeScreenRoute.name, path: ''),
          _i1.RouteConfig(ProfileScreenRoute.name, path: 'profile'),
          _i1.RouteConfig(EnterDetailsScreenRoute.name, path: 'enterDetails'),
          _i1.RouteConfig(UploadSlipScreenRoute.name, path: 'uploadSlip'),
          _i1.RouteConfig(AccountActivePendingRoute.name, path: 'activation'),
          _i1.RouteConfig(NotificationScreenRoute.name, path: 'notifications'),
          _i1.RouteConfig(AboutScreenRoute.name, path: 'about'),
          _i1.RouteConfig(BankScreenRoute.name, path: 'bank'),
          _i1.RouteConfig(SingleDayScreenRoute.name, path: 'singleDay'),
          _i1.RouteConfig(DayListScreenRoute.name, path: 'daylist'),
          _i1.RouteConfig(BalanceScreenRoute.name, path: 'balance'),
          _i1.RouteConfig(ReferalsScreenRoute.name, path: 'referals'),
          _i1.RouteConfig(HelpCenterScreenRoute.name, path: 'helpCenter'),
          _i1.RouteConfig(TermsAndConditionsScreenRoute.name,
              path: 'termsAndConditions')
        ])
      ];
}

class LoadingScreenRoute extends _i1.PageRouteInfo {
  const LoadingScreenRoute() : super(name, path: '/');

  static const String name = 'LoadingScreenRoute';
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/login');

  static const String name = 'LoginScreenRoute';
}

class SignUpScreenRoute extends _i1.PageRouteInfo {
  const SignUpScreenRoute() : super(name, path: '/signup');

  static const String name = 'SignUpScreenRoute';
}

class WelcomeScreenRoute extends _i1.PageRouteInfo {
  const WelcomeScreenRoute() : super(name, path: '/welcome');

  static const String name = 'WelcomeScreenRoute';
}

class HomeBaseRoute extends _i1.PageRouteInfo {
  const HomeBaseRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/home_base', initialChildren: children);

  static const String name = 'HomeBaseRoute';
}

class HomeScreenRoute extends _i1.PageRouteInfo {
  const HomeScreenRoute() : super(name, path: '');

  static const String name = 'HomeScreenRoute';
}

class ProfileScreenRoute extends _i1.PageRouteInfo {
  const ProfileScreenRoute() : super(name, path: 'profile');

  static const String name = 'ProfileScreenRoute';
}

class EnterDetailsScreenRoute extends _i1.PageRouteInfo {
  const EnterDetailsScreenRoute() : super(name, path: 'enterDetails');

  static const String name = 'EnterDetailsScreenRoute';
}

class UploadSlipScreenRoute
    extends _i1.PageRouteInfo<UploadSlipScreenRouteArgs> {
  UploadSlipScreenRoute({required _i22.UserModel userModel})
      : super(name,
            path: 'uploadSlip',
            args: UploadSlipScreenRouteArgs(userModel: userModel));

  static const String name = 'UploadSlipScreenRoute';
}

class UploadSlipScreenRouteArgs {
  const UploadSlipScreenRouteArgs({required this.userModel});

  final _i22.UserModel userModel;
}

class AccountActivePendingRoute extends _i1.PageRouteInfo {
  const AccountActivePendingRoute() : super(name, path: 'activation');

  static const String name = 'AccountActivePendingRoute';
}

class NotificationScreenRoute extends _i1.PageRouteInfo {
  const NotificationScreenRoute() : super(name, path: 'notifications');

  static const String name = 'NotificationScreenRoute';
}

class AboutScreenRoute extends _i1.PageRouteInfo {
  const AboutScreenRoute() : super(name, path: 'about');

  static const String name = 'AboutScreenRoute';
}

class BankScreenRoute extends _i1.PageRouteInfo {
  const BankScreenRoute() : super(name, path: 'bank');

  static const String name = 'BankScreenRoute';
}

class SingleDayScreenRoute extends _i1.PageRouteInfo<SingleDayScreenRouteArgs> {
  SingleDayScreenRoute({required String title, required String meta})
      : super(name,
            path: 'singleDay',
            args: SingleDayScreenRouteArgs(title: title, meta: meta));

  static const String name = 'SingleDayScreenRoute';
}

class SingleDayScreenRouteArgs {
  const SingleDayScreenRouteArgs({required this.title, required this.meta});

  final String title;

  final String meta;
}

class DayListScreenRoute extends _i1.PageRouteInfo {
  const DayListScreenRoute() : super(name, path: 'daylist');

  static const String name = 'DayListScreenRoute';
}

class BalanceScreenRoute extends _i1.PageRouteInfo {
  const BalanceScreenRoute() : super(name, path: 'balance');

  static const String name = 'BalanceScreenRoute';
}

class ReferalsScreenRoute extends _i1.PageRouteInfo {
  const ReferalsScreenRoute() : super(name, path: 'referals');

  static const String name = 'ReferalsScreenRoute';
}

class HelpCenterScreenRoute extends _i1.PageRouteInfo {
  const HelpCenterScreenRoute() : super(name, path: 'helpCenter');

  static const String name = 'HelpCenterScreenRoute';
}

class TermsAndConditionsScreenRoute extends _i1.PageRouteInfo {
  const TermsAndConditionsScreenRoute()
      : super(name, path: 'termsAndConditions');

  static const String name = 'TermsAndConditionsScreenRoute';
}
