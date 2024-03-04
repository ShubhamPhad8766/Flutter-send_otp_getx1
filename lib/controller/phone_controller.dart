// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:otp/model/send_otp_model.dart';
import 'package:otp/model/verify_model.dart';
import 'package:otp/model/verify_token_model.dart';
import 'package:otp/prefreence/local_prefreence.dart';
import 'package:otp/screens/home_screen.dart';
import 'package:otp/screens/verify_screen.dart';
import 'package:otp/services/otp_services.dart';

class PhoneController extends GetxController {
  final TextEditingController editphoneCotroller = TextEditingController();
  final OtpRepo otpRepo = OtpRepo();
  final Rx<SendOtpModel> sendOtpModel = SendOtpModel().obs;
  final _errorMessage = "".obs;
  String get errorMessage => _errorMessage.value;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  final TextEditingController otpTextEditController = TextEditingController();
  final Rx<VerifyOtpModel> verifyOtpModel = VerifyOtpModel().obs;

  void sendOtp(BuildContext context) async {
    _isLoading.value = true;
    var phoneNumber =
        Get.find<PhoneController>().editphoneCotroller.text.trim();

    if (phoneNumber.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid mobile number'),
        ),
      );
      return;
    }

    var parameters = {"phoneNumber": phoneNumber, "groupId": 1703228300417};
    var response = await otpRepo.sendOtp1(parameters);
    response.fold((faliure) {
      _errorMessage.value = faliure.message;
      _isLoading(false);
      SnackBar(
        content: Text(faliure.message),
      );
    }, (data) async {
      _errorMessage.value = '';
      _isLoading(false);
      sendOtpModel.value = data;
      print("${sendOtpModel.value = data}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(sendOtpModel.value.message.toString()),
        ),
      );

      if (data.status == 'Success') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyScreen(),
            ));
      }
    });
  }

  void verifOtp(BuildContext context) async {
    _isLoading(true);

    final phoneNumber = editphoneCotroller.text;
    print("**********$phoneNumber*************");
    var parameters = {
      "phoneNumber": phoneNumber,
      "otp": int.parse(otpTextEditController.text),
    };

    var response = await otpRepo.verifOtp(parameters);

    response.fold((failure) {
      _errorMessage.value = failure.message;
      _isLoading(false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    }, (data) async {
      _isLoading(false);
      verifyOtpModel.value = data;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(verifyOtpModel.value.message.toString()),
        ),
      );

      if (data.status == 'Success') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        otpTextEditController.clear();
      }
    });
  }

  void refershToekn({required String token, required int groupId}) async {
    try {
      var response = await http.post(
          Uri.parse(
              'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com//authgw/refresh-token'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              <String, dynamic>{'token': token, 'groupId': groupId}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        VerifyTokenModel verifyTokenModel = VerifyTokenModel.fromJson(data);
        LocalStorageUtils.saveUserDetails(token);
        print("refresh token is $token ");
        print(
            "OTP verify successfully. Status: ${verifyTokenModel.status}, Message: ${verifyTokenModel.message}");
      } else {
        print('Failed to verify OTP: ${response.statusCode}');
      }
    } catch (e) {
          print('Error verifying OTP: $e');

    }
  }
}
