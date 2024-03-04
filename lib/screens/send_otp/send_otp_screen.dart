import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp/controller/send_otp_controller/send_otp_controlle.dart';
import 'package:otp/screens/verify_screen.dart';

class SendOtpScreen1 extends StatefulWidget {
  const SendOtpScreen1({Key? key}) : super(key: key);

  @override
  State<SendOtpScreen1> createState() => _SendOtpScreen1State();
}

class _SendOtpScreen1State extends State<SendOtpScreen1> {
  final SendOtpController _controller = Get.put(SendOtpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Send Otp Tejas Sir"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp regExp = RegExp(pattern);
                  if (value!.isEmpty) {
                    return 'Add your phone No';
                  } else if (value.length != 10 || !regExp.hasMatch(value)) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _controller.phoneController,
                decoration: const InputDecoration(
                  hintText: "Enter PhoneNumber",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String phoneNumber = _controller.phoneController.text;

                    if (phoneNumber.length == 10) {
                      _controller.sendOtp(
                          context: context, number: phoneNumber);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please enter a valid 10-digit phone number.'),
                        ),
                      );
                    }

                    if (phoneNumber.length == 10) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VerifyScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text("Send"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   Widget _sendOtpButton(BuildContext context) {
//     return Obx(() => ElevatedButton(
//         onPressed: () {
//           if (_controller.phoneController.text.length == 10) {}
//         },
//         child: const Text("Send")));
//   }
// }
