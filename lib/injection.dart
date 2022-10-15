import 'package:db_offline_flutter/core/dio_util.dart';
import 'package:db_offline_flutter/data/datasources/local_contact_data_source.dart';
import 'package:db_offline_flutter/data/datasources/local_customer_info_data_source.dart';
import 'package:db_offline_flutter/presentation/blocs/contact/contact_bloc.dart';
import 'package:db_offline_flutter/presentation/blocs/customer_info/customer_info_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/helper/database_helper.dart';
import 'data/datasources/remote_customer_info_data_source.dart';
import 'data/repositories/local_contact_repository_impl.dart';
import 'data/repositories/local_customer_info_repository_impl.dart';
import 'data/repositories/remote_customer_info_repository_impl.dart';
import 'domain/repositories/local_contact_repository.dart';
import 'domain/repositories/local_customer_info_repository.dart';
import 'domain/repositories/remote_customer_info_repository.dart';
import 'domain/usecases/local_delete_all_customer_info_usecase.dart';
import 'domain/usecases/local_delete_contact_usecase.dart';
import 'domain/usecases/local_get_all_contact_usecase.dart';
import 'domain/usecases/local_get_all_costumer_info_usecase.dart';
import 'domain/usecases/local_insert_contact_usecase.dart';
import 'domain/usecases/local_insert_customer_info_usecase.dart';
import 'domain/usecases/local_update_contact_usecase.dart';
import 'domain/usecases/remote_get_all_customer_info_usecase.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio client
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<DioUtil>(DioUtil(Dio()));

  //sqflite helper
  locator.registerSingleton<DatabaseHelper>(DatabaseHelper());
  // locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //use case
  locator.registerLazySingleton(() => LocalGetAllContactUseCase(locator()));
  locator.registerLazySingleton(() => LocalInsertContactUseCase(locator()));
  locator.registerLazySingleton(() => LocalUpdateContactUseCase(locator()));
  locator.registerLazySingleton(() => LocalDeleteContactUseCase(locator()));
  locator.registerLazySingleton(() => LocalGetAllCustomerInfoUseCase(locator()));
  locator.registerLazySingleton(() => LocalInsertCustomerInfoUseCase(locator()));
  locator.registerLazySingleton(() => LocalDeleteAllCustomerInfoUseCase(locator()));
  locator.registerLazySingleton(() => RemoteGetAllCustomerInfoUseCase(locator()));

  //repository
  locator.registerLazySingleton<LocalContactRepository>(
        () => LocalContactRepositoryImpl(
        dataSource: locator()
    ),
  );
  locator.registerLazySingleton<LocalCustomerInfoRepository>(
        () => LocalCustomerInfoRepositoryImpl(
        dataSource: locator()
    ),
  );
  locator.registerLazySingleton<RemoteCustomerInfoRepository>(
        () => RemoteCustomerInfoRepositoryImpl(
        dataSource: locator()
    ),
  );

  //data sources
  locator.registerSingleton<LocalContactDataSource>(LocalContactDataSourceImpl(locator()));
  locator.registerSingleton<LocalCustomerInfoDataSource>(LocalCustomerInfoDataSourceImpl(locator()));
  locator.registerSingleton<RemoteCustomerInfoDataSource>(RemoteCustomerInfoDataSourceImpl(locator()));

  //bloc
  locator.registerFactory<ContactBloc>(() => ContactBloc(locator(), locator(), locator(), locator()));
  locator.registerFactory<CustomerInfoBloc>(() => CustomerInfoBloc(locator(), locator(), locator(), locator()));
}