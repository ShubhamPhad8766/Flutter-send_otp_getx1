import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp/controller/phone_controller.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});
  final PhoneController phoneController = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.opaqueSeparator,
        appBar: AppBar(
          backgroundColor: CupertinoColors.opaqueSeparator,
          title: const Text('Verify OTP'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController.otpTextEditController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Enter OTP',
                    labelText: 'Enter Otp'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    phoneController.verifOtp(context);
                  },
                  child: const Text("Verify")),
              Obx(() {
                if (phoneController.isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
