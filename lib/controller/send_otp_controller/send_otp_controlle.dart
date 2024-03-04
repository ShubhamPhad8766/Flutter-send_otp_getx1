import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp/api/api_manager.dart';
import 'package:otp/screens/send_otp/send_otp_screen.dart';
import 'package:otp/screens/verify_screen.dart';

class SendOtpController extends GetxController {
  final ApiManager apiManager = ApiManager();
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isError = false.obs;
  bool get isError => _isError.value;

  sendOtp({required BuildContext context, required String number}) async {
    var payload = {"phoneNumber": number, "groupId": 1703228300417};
    _isLoading(true);
    await apiManager.post(
      'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/authgw/sendotp',
      payload,
    );
    (data) {
      _isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Otp Send SuccesFully')));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SendOtpScreen1(),
          ));
    };
    (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(_isError.value.toString())));
      _isError.value = error;
      _isLoading(false);
    };
  }

  clearData() {
    _phoneController.clear();
  }

  void gotoNextScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyScreen(),
        ));
  }
}
