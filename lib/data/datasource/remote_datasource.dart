import 'package:bus_driver/core/base_usecase/base_usecase.dart';
import 'package:bus_driver/core/error/exceptions.dart';
import 'package:bus_driver/core/network/network_model/error_message_model.dart';
import 'package:bus_driver/core/utils/dio_helper.dart';
import 'package:bus_driver/data/modules/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRemoteDataSource{
  Future<String> loginApp(LoginParameter parameters);

}
class RemoteDataSource extends BaseRemoteDataSource{
  @override
  Future<String> loginApp(LoginParameter parameters) async{
   final result =await DioHelper.postData(url: 'login', data: {
     'email':parameters.email,
     'password':parameters.password,
   });
   print('carlossssssssss ${result.data}');
   print('carlossssssssss ${result.statusCode}');
   if(result.statusCode==200) {
     return result.data;
   } else {
     throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
   }
  }


}
