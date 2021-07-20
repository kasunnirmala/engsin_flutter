import 'package:engsinapp_flutter/resources/constants.dart';
import 'package:engsinapp_flutter/resources/resources.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;
import 'oauth2Helper.dart';

class OAuthSecureStorage extends OAuthStorage {
  final FlutterSecureStorage storage = fss.FlutterSecureStorage();
  final accessTokenKey = ACCESS_TOKEN_KEY;
  final refreshTokenKey = REFRESH_TOKEN_KEY;
  final accessTokenExpireAt = ACCESS_TOKEN_EXPIRE_AT;

  static final OAuthSecureStorage _oauthSecureStorage =
      OAuthSecureStorage._internal();

  factory OAuthSecureStorage() {
    return _oauthSecureStorage;
  }

  OAuthSecureStorage._internal();

  @override
  Future<OAuthToken> fetch() async {
    print(await storage.read(key: accessTokenKey));
    print(await storage.read(key: refreshTokenKey));
    print(await storage.read(key: accessTokenExpireAt));
    return OAuthToken(
      accessToken: await storage.read(key: accessTokenKey),
      refreshToken: await storage.read(key: refreshTokenKey),
      accessTokenExpiresAt:
          int.parse((await storage.read(key: accessTokenExpireAt)) ?? "0"),
    );
  }

  @override
  Future<OAuthToken> save(OAuthToken token) async {
    await storage.write(key: accessTokenKey, value: token.accessToken);
    await storage.write(key: refreshTokenKey, value: token.refreshToken);
    await storage.write(
        key: accessTokenExpireAt, value: token.accessTokenExpiresAt.toString());
    return token;
  }

  Future<void> clear() async {
    await storage.delete(key: accessTokenKey);
    await storage.delete(key: refreshTokenKey);
    await storage.delete(key: accessTokenExpireAt);
  }
}
