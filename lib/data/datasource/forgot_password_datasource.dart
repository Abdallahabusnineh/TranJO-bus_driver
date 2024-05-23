import 'package:bus_driver/core/error/exceptions.dart';
import 'package:bus_driver/core/network/network_model/error_message_model.dart';
import 'package:bus_driver/core/utils/app_const.dart';
import 'package:bus_driver/core/utils/dio_helper.dart';
import 'package:bus_driver/presentation/screens/forgot_password/forgot_password_content.dart';
import 'package:dartz/dartz.dart';

import '../../core/base_usecase/base_usecase.dart';


abstract class BaseForgotPasswordDataSource{
  Future<String> sendCode(ForgotPasswordParameter parameters) ;
  Future<String> verificationCode(VerificationParameter parameters) ;

}
class ForgotPasswordDataSource extends BaseForgotPasswordDataSource{
  @override
  Future<String> sendCode(ForgotPasswordParameter parameters) async {
  final result =await DioHelper.postData(url: forgotPassword, data:
  {
    'email': parameters.email,
  });
  print('send code ${result.data}');
  print('send code ${result.statusCode}');
  if(result.statusCode==200) {
    return result.data;
  } else {
    throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }
  }
  @override
  Future<String> verificationCode(VerificationParameter parameters) async {
    final result =await DioHelper.postData(url:verificationCodee, data:
    {
      'email': ForgotPasswordContent.email,
      'code':parameters.code,
      'newPassword':parameters.newPassword
    });
    print('vervication ${result.data}');
    print('staus is 200 ?? ${result.statusCode}');
    if(result.statusCode==200) {
      return result.data;
    } else {
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(result.data));
    }
  }

}