import 'package:bus_driver/core/utils/app_const.dart';
import 'package:dio/dio.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_model/error_message_model.dart';
import '../../core/utils/dio_helper.dart';

abstract class BaseDriverControlDataSource
{
  Future<String>getToggleWorkingStatus();
  Future<String>getDropPas();
  Future<String>getAddPas();
  Future<String>getUpdateBusLocation();
}
class DriverControlDataSource extends BaseDriverControlDataSource
{
  @override
  Future<String> getToggleWorkingStatus()async {
    try {
      final res = await DioHelper.postData(
          url:"toggleWorkingStatus",
          token: AppConst.token,
        data: {},
          );

      if (res.statusCode == 200 ||res.statusCode == 204||res.statusCode == 202) {
        return "success toggle";
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
  Future<String> getDropPas()async {
    try {
      final res = await DioHelper.postData(
        url:"drop-pas",
        token: AppConst.token,
        data: {},
      );

      if (res.statusCode == 200 ||res.statusCode == 204||res.statusCode == 202) {
        return "success Drop ";
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
  Future<String> getAddPas()async {
    try {
      final res = await DioHelper.postData(
        url:"add-pas",
        token: AppConst.token,
        data: {},
      );

      if (res.statusCode == 200 ||res.statusCode == 204||res.statusCode == 202) {
        return "success add ";
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
  Future<String> getUpdateBusLocation() async{
    try {
      final res = await DioHelper.postData(
        url:"updateBusLocation",
        token: AppConst.token,
        data: {},
      );

      if (res.statusCode == 200 ||res.statusCode == 204||res.statusCode == 202) {
        return "success updateBusLocation ";
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

}