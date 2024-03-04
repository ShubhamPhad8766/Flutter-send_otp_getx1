import 'package:get/get.dart';
import 'package:otp/model/delete_model.dart';
import 'package:otp/services/otp_services.dart';

class PutController extends GetxController {
  final RxBool error = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<DeleteModel> putModel = DeleteModel().obs;
  final OtpRepo otpRepo = OtpRepo();

  void putData(Map<String, dynamic> data, id) async {
    isLoading.value = true;

    var response = await otpRepo.putData(id, data);

    response.fold(
      (failure) {
        isLoading.value = false;
        error.value = true;
        errorMessage.value = failure.message;
      },
      (data) {
        isLoading.value = false;
        error.value = false;
        putModel.value = data;
      },
    );
  }
}
