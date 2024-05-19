import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/exceptions.dart';
import 'package:bus_driver/core/network/network_model/error_message_model.dart';
import 'package:bus_driver/core/utils/dio_helper.dart';
import 'package:bus_driver/data/modules/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../core/utils/app_const.dart';

abstract class BaseRemoteDataSource{
  Future<LoginUserDataModel> loginApp(LoginParameter parameters);

}
class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<LoginUserDataModel> loginApp(LoginParameter parameters) async{
   final result =await DioHelper.postData(url: login, data: {
     'email':parameters.email,
     'password':parameters.password,
   });
   print('login data ${result.data}');
   print('login status code ${result.statusCode}');
   if(result.statusCode==200) {
     return LoginUserDataModel.fromJson(result.data);
   } else {
     throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
   }
  }


}
