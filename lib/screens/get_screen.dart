// ignore_for_file: annotate_overrides, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:otp/controller/get_controller.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  final GetController getController = GetController();
  void initState() {
    getController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api"),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              getController.getData();
            },
            child: const Text('Get Data'),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(getController.getModel.body.toString()),
                    Text(getController.getModel.userId.toString())
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
