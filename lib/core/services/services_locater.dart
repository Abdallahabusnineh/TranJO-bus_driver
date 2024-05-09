import 'package:bus_driver/data/datasource/remote_datasource.dart';
import 'package:bus_driver/data/repository/bus_driver_repository.dart';
import 'package:bus_driver/domain/base_repository/base_trasnsjo_repository.dart';
import 'package:bus_driver/domain/usecases/login_usecase.dart';
import 'package:bus_driver/presentation/blocs/Login/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServicesLocater {
  void init() {
    //Bloc register
    sl.registerFactory(() => LoginBloc(sl()));
 //UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));
//Repository
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));//sl() معناها انو انتا لما تنادي عل سيرفيس لوكيتر رح تلاقي الاوبجيكت فيها

    sl.registerLazySingleton<BaseRemoteDataSource>(
            () => RemoteDataSource());
  }
}