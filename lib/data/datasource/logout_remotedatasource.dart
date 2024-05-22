import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/base_usecase/base_usecase.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_model/error_message_model.dart';
import '../../core/utils/app_const.dart';
import '../../core/utils/dio_helper.dart';

abstract class LogOutBaseDataSource {
  Future<String> logout(NoParameters parameters);
}
class LogOutDataSource extends LogOutBaseDataSource {
  @override
  Future<String> logout(NoParameters parameters) async {
    try {
      final result = await DioHelper.postData(url: appLogout, token: token, data: {});
      if (result?.statusCode == 200) {
        return result?.data;
      } else {
        print('logout');
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(
                'updated password datasource ${result?.data}'));
      }
    } on DioException catch (e) {
      log("updated password datasource ${e.requestOptions.uri}");
      log("updated password datasource ${e.requestOptions.uri}");
      log("updated password datasource  ${e.response!.statusCode}");
      log("updated password datasource  ${e.response!.data}");
      log("updated password datasource ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      print(' we enter updated password datasource catch ');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }
}
