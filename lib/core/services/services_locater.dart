import 'package:bus_driver/data/datasource/driver_control_datasource.dart';
import 'package:bus_driver/data/datasource/remote_datasource.dart';
import 'package:bus_driver/data/repository/bus_driver_repository.dart';
import 'package:bus_driver/data/repository/driver_control_repository.dart';
import 'package:bus_driver/domain/base_repository/base_trasnsjo_repository.dart';
import 'package:bus_driver/domain/base_repository/driver_control.dart';
import 'package:bus_driver/domain/usecases/add_pas_usecase.dart';
import 'package:bus_driver/domain/usecases/drop_pas_usecase.dart';
import 'package:bus_driver/domain/usecases/login_usecase.dart';
import 'package:bus_driver/domain/usecases/toggle_usecase.dart';
import 'package:bus_driver/domain/usecases/update_bus_location_usecase.dart';
import 'package:bus_driver/presentation/blocs/Login/login_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/logout_remotedatasource.dart';
import '../../data/repository/logout_repository.dart';
import '../../domain/base_repository/logout_base_repository.dart';
import '../../domain/usecases/logout_usecase.dart';

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



  }
}