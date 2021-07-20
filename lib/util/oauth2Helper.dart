library oauth_dio;

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

typedef OAuthToken OAuthTokenExtractor(Response response);
typedef Future<bool> OAuthTokenValidator(OAuthToken token);

/// Interceptor to send the bearer access token and update the access token when needed
class BearerInterceptor extends Interceptor {
  OAuth oauth;

  BearerInterceptor(this.oauth);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var token = await oauth.fetchOrRefreshAccessToken();
    print("TOKEN  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(token.accessToken);
    options.headers.addAll({"Authorization": "Bearer ${token.accessToken}"});
    super.onRequest(options, handler);
  }
  // @override
  // Future<void> onRequest(
  //     RequestOptions options, RequestInterceptorHandler handler) async {
  //   super.onRequest(options, handler);
  //   final token = await oauth.fetchOrRefreshAccessToken();
  //   print("TOKEN  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //   print(token!.accessToken);
  //   if (token != null) {
  //     options.headers.addAll({"Authorization": "Bearer ${token.accessToken}"});
  //   }
  //   // return options;
  // }
}

/// Use to implement a custom grantType
abstract class OAuthGrantType {
  RequestOptions handle(RequestOptions request);
}

/// Obtain an access token using a username and password
class PasswordGrant extends OAuthGrantType {
  String? username;
  String? password;
  List<String>? scope = [];

  PasswordGrant({this.username, this.password, this.scope});

  /// Prepare Request
  @override
  RequestOptions handle(RequestOptions request) {
    request.data =
        "grant_type=password&username=${Uri.encodeComponent(username!)}&password=${Uri.encodeComponent(password!)}&scope=${this.scope?.join(' ')}";
    return request;
  }
}

/// Obtain an access token using an refresh token
class RefreshTokenGrant extends OAuthGrantType {
  String? refreshToken;

  RefreshTokenGrant({this.refreshToken});

  /// Prepare Request
  @override
  RequestOptions handle(RequestOptions request) {
    request.data =
        "grant_type=refresh_token&refresh_token=$refreshToken&scope=";
    return request;
  }
}

/// Use to implement custom token storage
abstract class OAuthStorage {
  /// Read token
  Future<OAuthToken> fetch();

  /// Save Token
  Future<OAuthToken> save(OAuthToken token);

  /// Clear token
  Future<void> clear();
}

/// Save Token in Memory
class OAuthMemoryStorage extends OAuthStorage {
  late OAuthToken _token;

  /// Read
  @override
  Future<OAuthToken> fetch() async {
    return _token;
  }

  /// Save
  @override
  Future<OAuthToken> save(OAuthToken token) async {
    return _token = token;
  }

  /// Clear
  Future<void> clear() async {
    _token = OAuthToken();
  }
}

/// Token
class OAuthToken {
  String? accessToken;
  String? refreshToken;
  int accessTokenExpiresAt;
  bool status;
  String error;
  OAuthToken(
      {this.accessToken,
      this.refreshToken,
      this.accessTokenExpiresAt = 0,
      this.status = true,
      this.error = ""});
}

/// Encode String To Base64
Codec<String, String> stringToBase64 = utf8.fuse(base64);

/// OAuth Client
class OAuth {
  Dio? dio;
  String? tokenUrl;
  String? clientId;
  String? clientSecret;
  OAuthStorage? storage;
  OAuthTokenExtractor? extractor;
  OAuthTokenValidator? validator;

  OAuth(
      {this.tokenUrl,
      this.clientId,
      this.clientSecret,
      this.extractor,
      this.dio,
      this.storage,
      this.validator}) {
    dio = dio ?? Dio();
    storage = storage!;
    extractor = extractor ??
        (res) => OAuthToken(
              accessToken: res.data['access_token'],
              refreshToken: res.data['refresh_token'],
              accessTokenExpiresAt: res.data['expiresAt'],
            );
    validator = validator ??
        (token) {
          if (token.accessToken == null) {
            print("<<<<<<<<<<<<<<<< NULL ACCESS TOKEN >>>>>>>>>>>>>>>>>>>>>>>");
            return Future.value(false);
          }
          print("JWT IS EXPIRED >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          int currTimeStamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
          print(currTimeStamp > token.accessTokenExpiresAt);
          return Future.value(currTimeStamp < token.accessTokenExpiresAt);
        };
  }

  Future<OAuthToken> requestTokenAndSave(OAuthGrantType grantType) async {
    return requestToken(grantType)
        .then((token) => storage!.save(token))
        .catchError((onError) {
      // print(getErrorMessage(onError));
      return OAuthToken(status: false, error: getErrorMessage(onError));
    });
  }

  String getErrorMessage(error) {
    print(error);
    switch (error.type) {
      case DioErrorType.cancel:
        return "Request is cancelled";
      case DioErrorType.connectTimeout:
        return "Connection is timedout";
      case DioErrorType.sendTimeout:
        return "Sending is timedout";
      case DioErrorType.receiveTimeout:
        return "Receiving is timedout";
      case DioErrorType.response:
        {
          switch (error.response.statusCode) {
            case 400:
              return error.response.data["hint"] == null
                  ? error.response.data.toString()
                  : error.response.data["hint"] == ""
                      ? "Username and Password mismatch."
                      : error.response.data["hint"];
            case 500:
              return "You have encountered a server error. Please contact Us.";
            case 302:
              return "Can't find the user. Please signup.";
            case 401:
              return "Can't authenticate. Please retry or check app updates.";
            default:
              return "You have encountered an application error. Please Contact Us.";
          }
        }

      case DioErrorType.other:
        return "Please check your connectivity.";

      default:
        return "You have encountered an application error. Please Contact Us.";
    }
  }

  /// Request a new Access Token using a strategy
  Future<OAuthToken> requestToken(OAuthGrantType grantType) {
    final request = grantType.handle(RequestOptions(
        method: 'POST',
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization":
              "Basic ${stringToBase64.encode('$clientId:$clientSecret')}"
        },
        path: ''));

    Options op = Options(headers: request.headers, method: request.method);

    return dio!
        .request(tokenUrl!, data: request.data, options: op)
        .then((res) => extractor!(res));
    // .catchError((DioError onError) => OAuthToken(status: false,error: onError.response.data["message"]));
  }

  /// return current access token or refresh
  Future<OAuthToken> fetchOrRefreshAccessToken() async {
    OAuthToken token = await storage!.fetch();

    if (await this.validator!(token)) {
      print("ACCESS TOKEN VALIDATED   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      return token;
    }
    print("REFRESH TOKEN REQUESTED   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    return await this.refreshAccessToken();
  }

  /// Refresh Access Token
  Future<OAuthToken> refreshAccessToken() async {
    OAuthToken token = await storage!.fetch();

    return this.requestTokenAndSave(
        RefreshTokenGrant(refreshToken: token.refreshToken));
  }
}
