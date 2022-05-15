import 'package:db_offline_flutter/presentation/blocs/contact/contact_bloc.dart';
import 'package:db_offline_flutter/presentation/blocs/customer_info/customer_info_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/data_sources/local/dao/contact_dao.dart';
import 'data/data_sources/local/dao/customer_info_dao.dart';
import 'data/data_sources/local/helper/database_helper.dart';
import 'data/data_sources/remote/provider/customer_info_provider.dart';
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

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio client
  injector.registerSingleton<Dio>(Dio());

  //Network provider
  injector.registerSingleton<CustomerInfoProvider>(CustomerInfoProvider(injector()));

  //Sqflite helper
  injector.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //Local storage
  injector.registerLazySingleton<ContactDao>(() => ContactDao(injector()));
  injector.registerLazySingleton<CustomerInfoDao>(() => CustomerInfoDao(injector()));

  //Repositories
  injector.registerSingleton<RemoteCustomerInfoRepository>(RemoteCustomerInfoRepositoryImpl(injector()),);
  injector.registerSingleton<LocalContactRepository>(LocalContactRepositoryImpl(injector()),);
  injector.registerSingleton<LocalCustomerInfoRepository>(LocalCustomerInfoRepositoryImpl(injector()),);

  //UseCases
  injector.registerSingleton<RemoteGetAllCustomerInfoUseCase>(RemoteGetAllCustomerInfoUseCase(injector()));
  injector.registerSingleton<LocalGetAllContactUseCase>(LocalGetAllContactUseCase(injector()));
  injector.registerSingleton<LocalInsertContactUseCase>(LocalInsertContactUseCase(injector()));
  injector.registerSingleton<LocalUpdateContactUseCase>(LocalUpdateContactUseCase(injector()));
  injector.registerSingleton<LocalDeleteContactUseCase>(LocalDeleteContactUseCase(injector()));
  injector.registerSingleton<LocalGetAllCustomerInfoUseCase>(LocalGetAllCustomerInfoUseCase(injector()));
  injector.registerSingleton<LocalInsertCustomerInfoUseCase>(LocalInsertCustomerInfoUseCase(injector()));
  injector.registerSingleton<LocalDeleteAllCustomerInfoUseCase>(LocalDeleteAllCustomerInfoUseCase(injector()));

  //Blocs
  injector.registerFactory<ContactBloc>(() => ContactBloc(injector(), injector(), injector(), injector()));
  injector.registerFactory<CustomerInfoBloc>(() => CustomerInfoBloc(injector(), injector(), injector(), injector()));
}