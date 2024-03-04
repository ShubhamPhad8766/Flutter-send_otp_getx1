// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp/controller/put_controller.dart';

class PutScreen extends StatelessWidget {
  final PutController putController = Get.put(PutController());
  final TextEditingController dataController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  PutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PUT API"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: 'Enter ID',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: dataController,
                decoration: const InputDecoration(
                  labelText: 'Enter Data',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  int? id = int.tryParse(idController.text);
                  if (id != null) {
                    Map<String, dynamic> data = {
                      'name': 'value1',
                      'avatar': 'value2',
                    };
                    putController.putData(data, 7);
                  } else {
                    print('Invalid ID');
                  }
                },
                child: const Text('Put Data'),
              ),
              Obx(
                () {
                  if (putController.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else if (putController.error.value) {
                    return Text('Error: ${putController.errorMessage.value}');
                  } else if (putController.putModel.value != null) {
                    return const Text('Put Successfully');
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
