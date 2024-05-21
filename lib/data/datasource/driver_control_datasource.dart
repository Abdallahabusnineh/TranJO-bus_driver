import 'dart:developer';
import 'package:bus_driver/core/utils/app_const.dart';
import 'package:dio/dio.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_model/error_message_model.dart';
import '../../core/utils/dio_helper.dart';

abstract class BaseDriverControlDataSource
{
  Future<String>getToggleWorkingStatus();
  Future<int>getDropPas();
  Future<int>getAddPas();
  Future<int>resetNumberOfPassenger();
  Future<String>getUpdateBusLocation();
}
class DriverControlDataSource extends BaseDriverControlDataSource
{
  @override
  Future<String> getToggleWorkingStatus()async {
    try {
      final result = await DioHelper.postData(
          url:toggleWorkingStatus,
          token: token,
        data: {},
          );

      if (result.statusCode == 200 ) {
        return result.data;
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(result.statusMessage!));
      }
    } on DioException catch (e) {
      log("toggle data source ${e.requestOptions.uri}");
      log("toggle data source  ${e.requestOptions.uri}");
      log("toggle data source  ${e.response!.statusCode}");
      log("toggle data source  ${e.response!.data}");
      log("toggle data source ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<int> getDropPas()async {
    try {
      final result = await DioHelper.postData(
        url:dropPassenger,
        token: token,
        data: {},
      );

      if (result.statusCode == 200) {
        return result.data;
      } else {

        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(result.statusMessage!));
      }
    } on DioException catch (e) {
      log("drop pass datasource ${e.requestOptions.uri}");
      log("drop pass datasource ${e.requestOptions.uri}");
      log("drop pass datasource  ${e.response!.statusCode}");
      log("drop pass datasource ${e.response!.data}");
      log("drop pass datasource ${e.requestOptions.uri}");

      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson("Error ${e.message}"));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<int> getAddPas()async {
    try {
      final result = await DioHelper.postData(
        url:addPassenger,
        token: token,
        data: {},
      );

      if (result.statusCode == 200) {
        return result.data;
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(result.statusMessage!));
      }
    } on DioException catch (e) {
      log("add pass datasource ${e.requestOptions.uri}");
      log("add pass datasource ${e.requestOptions.uri}");
      log("add pass datasource ${e.response!.statusCode}");
      log("add pass datasource ${e.response!.data}");
      log("add pass datasource ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<String> getUpdateBusLocation() async{
    try {
      final res = await DioHelper.postData(
        url:updateBusLocation,
        token: token,
        data: {},
      );

      if (res.statusCode == 200 ||res.statusCode == 204||res.statusCode == 202) {
        return res.data;
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(res.statusMessage!));
      }
    } on DioException catch (e) {
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson("Error"));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

  @override
  Future<int> resetNumberOfPassenger() async {
    try {
      final result = await DioHelper.postData(
        url: resetNumberOfPass,
        token: token,
        data: {},
      );
      if (result.statusCode == 200) {
        return result.data;
      } else {
        throw ServerExceptions(
            errorMessageModel: ErrorMessageModel.fromJson(result.statusMessage!));
      }
    } on DioException catch (e) {
      log("resetNumberOfPassenger datasource ${e.requestOptions.uri}");
      log("resetNumberOfPassenger datasource ${e.requestOptions.uri}");
      log("resetNumberOfPassenger datasource ${e.response!.statusCode}");
      log("resetNumberOfPassenger datasource ${e.response!.data}");
      log("resetNumberOfPassenger datasource ${e.requestOptions.uri}");
      throw ServerExceptions(
          errorMessageModel:
          ErrorMessageModel.fromJson(e.message!));
    } catch (e) {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.toString()));
    }
  }

}