import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';

import '../../core/network/network_model/error_message_model.dart';
import '../../core/utils/app_const.dart';
import '../../core/utils/dio_helper.dart';
import '../modules/user_details_model.dart';

abstract class BaseUserDetailsDataSource
{
  Future<UserDetailsModel>getUserDetails();
}
class UserDetailsDataSource extends BaseUserDetailsDataSource
{
  @override
  Future<UserDetailsModel> getUserDetails()async {
    try {
      final res = await DioHelper.getdata(url: userDetails,token: token);

      return UserDetailsModel.fromJson(res!.data);
    } on DioException catch (e) {

      log("User Details datasource ${e.requestOptions.uri}");
      log("User Details datasource ${e.requestOptions.uri}");
      log("User Details datasource  ${e.response!.statusCode}");
      log("User Details datasource  ${e.response!.data}");
      log("User Details datasource ${e.requestOptions.uri}");

      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));

    }
  }

}