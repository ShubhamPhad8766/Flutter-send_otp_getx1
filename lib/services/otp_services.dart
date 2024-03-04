// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:dartz/dartz.dart';
import 'package:otp/api/api_manager.dart';
import 'package:otp/api/app_expaction.dart';
import 'package:otp/api/faliure.dart';
import 'package:otp/model/delete_model.dart';
import 'package:otp/model/get_model.dart';
import 'package:otp/model/send_otp_model.dart';
import 'package:otp/model/verify_model.dart';

class OtpRepo {
  final ApiManager apiManager = ApiManager();
  Future<Either<Failure, SendOtpModel>> sendOtp1(paremeters) async {
    try {
      var resposne = await apiManager.post(
          'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/authgw/sendotp',
          paremeters);
      var json = SendOtpModel.fromJson(resposne);
      return right(json);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, VerifyOtpModel>> verifOtp(paremeters) async {
    try {
      var response = await apiManager.post(
          'https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/auth/validateOtp/',
          paremeters);
      var jsonRsponse = VerifyOtpModel.fromJson(response);
      // refershToekn(token: response.token.toString(), groupId: 1703228300417);
      return right(jsonRsponse);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, GetModel>> getData() async {
    try {
      var response =
          await apiManager.get('https://jsonplaceholder.typicode.com/posts');
      var jsonresponse = GetModel.fromJson(response);
      print(
          "*************************************************************************************");
      return right(jsonresponse);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> deteleData(int? id) async {
    try {
      var response = await apiManager.delete(
          'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi/$id');
      return right("response");
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, DeleteModel>> putData(
      Map<String, dynamic> data, parameters) async {
    try {
      var response = await apiManager.put(
          'https://65804ce16ae0629a3f54dbdb.mockapi.io/Apiendpoint/PostApi/$id',
          parameters);
      var jsonRespnse = DeleteModel.fromJson(response);
      return right(jsonRespnse);
    } on AppException catch (e) {
      return left(ApiFailure(message: e.message));
    } catch (e) {
      return left(ApiFailure(message: e.toString()));
    }
  }
}
