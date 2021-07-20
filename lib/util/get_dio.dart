import 'package:dio/dio.dart';
import 'dio_helper.dart';

class GetDio {
  static final GetDio _oauthSecureStorage = GetDio._internal();

  factory GetDio() {
    return _oauthSecureStorage;
  }

  GetDio._internal();

  Dio get() {
    return DioHelper.getDio("f11b4f5b9dcbdf2eccca0313624b77de",
        "d9705954503a085f0cc1c392c2b58064522f8ee874254b4e4c9f3970b1413ea6a002080ef8a9f18275fa9fa40218e4be834255686dc560ed452df1d6b781c096f6e750011697ff5898315554fd4dbae0d0e8e4b798367a373e2b17bbc1bf15398823dd470652dce25efd850a5b97261848a81d668185558239b871cce4aaad61");
  }
}
