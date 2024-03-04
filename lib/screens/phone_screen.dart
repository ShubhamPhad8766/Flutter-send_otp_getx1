import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp/controller/phone_controller.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final PhoneController _phoneController = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.opaqueSeparator,
        appBar: AppBar(
          backgroundColor: CupertinoColors.opaqueSeparator,
          title: const Text("Send Otp"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: _phoneController.editphoneCotroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Enter Phone Number',
                  labelText: 'Phone Number'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Obx(() => _phoneController.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => _phoneController.sendOtp(context),
                    child: const Text("Send Otp"))),
            Obx(() => _phoneController.errorMessage.isEmpty
                ? Center(
                    child: Text(
                    _phoneController.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ))
                : const SizedBox()),
          ]),
        ),
      ),
    );
  }
}
