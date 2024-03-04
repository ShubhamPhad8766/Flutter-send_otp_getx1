// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:otp/model/get_model.dart';
import 'package:otp/services/otp_services.dart';

class GetController extends GetxController {
  final OtpRepo otpRepo = OtpRepo();
  final Rx<GetModel> _getModel = GetModel().obs;
  GetModel get getModel => _getModel.value;
  final _errorMessage = "Data Not Found".obs;
  final _isDataLoading = false.obs;
  bool get isDataLoading => _isDataLoading.value;

  getData() async {
    _isDataLoading.value = true;

    var response = await otpRepo.getData();
    response.fold(
      (failure) {
        _errorMessage.value = failure.message;
        _isDataLoading.value = false;
      },
      (data) {
        _getModel.value = data;
        print(
            "***********************************${data.id}********************************");
        _isDataLoading.value = false;
      },
    );
  }
}
