import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp/controller/delete_controller.dart';

class DeleteScreen extends StatelessWidget {
  final DeleteController deleteController = Get.put(DeleteController());
  final TextEditingController idController = TextEditingController();

  DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete API"),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  int? id = int.tryParse(idController.text);
                  if (id != null) {
                    deleteController.deleteData(id: id);
                  } else {
                    print('Invalid ID');
                  }
                },
                child: const Text('Delete Data'),
              ),
              Obx(
                () {
                  if (deleteController.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else if (deleteController.isError.value) {
                    return Text(
                        'Error: ${deleteController.errorMessage.value}');
                  } else if (deleteController.deleteModel.value != null) {
                    return const Text('Deleted Successfully');
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
