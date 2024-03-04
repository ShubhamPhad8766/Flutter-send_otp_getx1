import 'package:get/get.dart';
import 'package:otp/model/delete_model.dart';
import 'package:otp/services/otp_services.dart';

class DeleteController extends GetxController {
  final Rx<DeleteModel> deleteModel = DeleteModel().obs;
  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;
  final RxString errorMessage = ''.obs;

  final OtpRepo otpRepo = OtpRepo();

  void deleteData({int? id}) async {
    isLoading.value = true;

    var response = await otpRepo.deteleData(id);
    response.fold(
      (error) {
        isLoading.value = false;
        isError.value = true;
        errorMessage.value = error.message;
      },
      (data) {
        isLoading.value = false;
        isError.value = false;
        deleteModel.value = data;
      },
    );
  }
}
