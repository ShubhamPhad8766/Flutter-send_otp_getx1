
// ignore_for_file: depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:otp/model/token_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class LocalStorageUtils {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static TokenData get tokenResponseModel => userData();

  static Future<void> saveUserDetails(String token) async {
    await instance.setString("token", token);
    log("Token saved! $token");
    log("*******token saved " + token);
  }

  static Future<String?> fetchToken() async {
    final token = instance.getString('token') ?? '';

    if (token.isEmpty) {
      return "";
    }

    return token;
  }

  static TokenData userData() {
    final token = instance.getString('token') ?? "";
    var userData = JwtDecoder.decode(token);
    var userDecoded = TokenData.fromJson(userData);

    log("***********userDecode $userDecoded");
    return userDecoded;
  }
}
