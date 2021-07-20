import 'package:dio/dio.dart';
import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/util/oAuthSecureStorage.dart';
import 'oauth2Helper.dart';

class DioHelper {
  static late OAuth oauth;
  static Dio getDio(String clientID, String clientSecret) {
    oauth = OAuth(
        tokenUrl: BASE_URL + '/token',
        clientId: clientID,
        clientSecret: clientSecret,
        storage: OAuthSecureStorage(),
        validator: (OAuthToken token) {
          if (token.accessToken == null) {
            print("<<<<<<<<<<<<<<<< NULL ACCESS TOKEN >>>>>>>>>>>>>>>>>>>>>>>");
            return Future.value(false);
          }
          print("JWT IS EXPIRED >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
          int currTimeStamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
          print(currTimeStamp > token.accessTokenExpiresAt);
          return Future.value(currTimeStamp < token.accessTokenExpiresAt);
        });

    Dio _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      // connectTimeout: 300000,
    ))
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
      ..interceptors.add(BearerInterceptor(oauth));

    return _dio;
  }
}
