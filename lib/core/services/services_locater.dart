import 'package:bus_driver/data/datasource/driver_control_datasource.dart';
import 'package:bus_driver/data/datasource/forgot_password_datasource.dart';
import 'package:bus_driver/data/datasource/remote_datasource.dart';
import 'package:bus_driver/data/repository/bus_driver_repository.dart';
import 'package:bus_driver/data/repository/driver_control_repository.dart';
import 'package:bus_driver/data/repository/forgot_password_repository.dart';
import 'package:bus_driver/domain/base_repository/base_trasnsjo_repository.dart';
import 'package:bus_driver/domain/base_repository/driver_control.dart';
import 'package:bus_driver/domain/base_repository/forgot_password_repo.dart';
import 'package:bus_driver/domain/usecases/add_pas_usecase.dart';
import 'package:bus_driver/domain/usecases/drop_pas_usecase.dart';
import 'package:bus_driver/domain/usecases/forgot_password/forgot_password_usecase.dart';
import 'package:bus_driver/domain/usecases/forgot_password/verification_usecase.dart';
import 'package:bus_driver/domain/usecases/login_usecase.dart';
import 'package:bus_driver/domain/usecases/resetnumber_ofpassenger.dart';
import 'package:bus_driver/domain/usecases/toggle_usecase.dart';
import 'package:bus_driver/domain/usecases/update_bus_location_usecase.dart';
import 'package:bus_driver/presentation/blocs/Login/login_bloc.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/forgot_password_bloc.dart';
import 'package:bus_driver/presentation/blocs/forgotpassword/verification_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/logout_remotedatasource.dart';
import '../../data/datasource/user_details_datasource.dart';
import '../../data/repository/logout_repository.dart';
import '../../data/repository/user_details_repository.dart';
import '../../domain/base_repository/logout_base_repository.dart';
import '../../domain/base_repository/user_details_base_repository.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/user_details_usecase.dart';

final sl = GetIt.instance;
class ServicesLocater {
  void init() {
    //===============================login===========================



    //Bloc register

 //UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
//Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));//sl() معناها انو انتا لما تنادي عل سيرفيس لوكيتر رح تلاقي الاوبجيكت فيها

    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());



    //=============================DriverControl=======================



    //=============================UseCase=============================
    sl.registerLazySingleton(() => AddPasUseCase(sl()));
    sl.registerLazySingleton(() => ResetNumberOfPassengerUseCase(sl()));
    sl.registerLazySingleton(() => UpdateBusLocationUseCase(sl()));
    sl.registerLazySingleton(() => ToggleUseCase(sl()));
    sl.registerLazySingleton(() => DropPasUseCase(sl()));
    //=============================Repository==========================
    sl.registerLazySingleton<BaseDriverControlRepository>(() =>(DriverControlRepository(sl())) );
    //=============================DataSource==========================
    sl.registerLazySingleton<BaseDriverControlDataSource>(() =>DriverControlDataSource() );

  //logout

    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton<LogOutBaseRepository>(() => LogOutRepository(
        sl()));
    sl.registerLazySingleton<LogOutBaseDataSource>(() => LogOutDataSource());

    //user details
    sl.registerLazySingleton(()=>UserDetailsUseCase(sl()));
    sl.registerLazySingleton<BaseUserDetailsRepository>(()=>UserDetailsRepository(sl()));
    sl.registerLazySingleton<BaseUserDetailsDataSource>(()=>UserDetailsDataSource());


    sl.registerFactory(() => ForgotPasswordBloc(sl()));
    sl.registerFactory(() => VerificationBloc(sl()));
    sl.registerLazySingleton(() => SendCodeUseCase(sl()));
    sl.registerLazySingleton(() => VerificationUseCase(sl()));
    sl.registerLazySingleton<BaseForgotPasswordRepository>(() => ForgotPasswordRepository(
        sl()));
    sl.registerLazySingleton<BaseForgotPasswordDataSource>(() => ForgotPasswordDataSource());

  }
}