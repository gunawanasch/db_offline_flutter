import 'package:db_offline_flutter/data/models/customer_info_model.dart';
import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';
import 'package:db_offline_flutter/domain/usecases/local_delete_all_customer_info_usecase.dart';
import 'package:db_offline_flutter/domain/usecases/local_get_all_costumer_info_usecase.dart';
import 'package:db_offline_flutter/domain/usecases/local_insert_customer_info_usecase.dart';
import 'package:db_offline_flutter/domain/usecases/remote_get_all_customer_info_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_info_event.dart';
import 'customer_info_state.dart';

class CustomerInfoBloc extends Bloc<CustomerInfoEvent, CustomerInfoState> {
  final RemoteGetAllCustomerInfoUseCase _remoteGetAllCustomerInfoUseCase;
  final LocalGetAllCustomerInfoUseCase _localGetAllCustomerInfoUseCase;
  final LocalInsertCustomerInfoUseCase _localInsertCustomerInfoUseCase;
  final LocalDeleteAllCustomerInfoUseCase _localDeleteAllCustomerInfoUseCase;

  // CustomerInfoBloc(
  //     this._remoteGetAllCustomerInfoUseCase,
  //     this._localGetAllCustomerInfoUseCase,
  //     this._localInsertCustomerInfoUseCase,
  //     this._localDeleteAllCustomerInfoUseCase
  //     ) : super(const CustomerInfoInitial());
  //
  // @override
  // Stream<CustomerInfoState> mapEventToState(
  //     CustomerInfoEvent event,
  //     ) async* {
  //   if (event is CustomerInfo) {
  //     try {
  //       yield const CustomerInfoLoading();
  //       final response = await _remoteGetAllCustomerInfoUseCase();
  //       await _localDeleteAllCustomerInfoUseCase();
  //       if (response.dataGetAllCustomerInfo!.isNotEmpty) {
  //         for (var i in response.dataGetAllCustomerInfo!) {
  //           await _localInsertCustomerInfoUseCase(
  //               params: CustomerInfoModel(
  //                   idCustomerInfo: i.idCustomerInfo,
  //                   name: i.name,
  //                   phone: i.phone
  //               )
  //           );
  //         }
  //       }
  //       yield CustomerInfoSuccess(await _localGetAllCustomerInfoUseCase());
  //     } catch (e) {
  //       yield CustomerInfoError(e.toString());
  //     }
  //   }
  // }

  CustomerInfoBloc(
      this._remoteGetAllCustomerInfoUseCase,
      this._localGetAllCustomerInfoUseCase,
      this._localInsertCustomerInfoUseCase,
      this._localDeleteAllCustomerInfoUseCase,
      ) : super(const CustomerInfoInitial()) {
    on<CustomerInfoEvent>((event, emit) async {
      if (event is CustomerInfo) {
        emit(const CustomerInfoLoading());
        final resultRemote = await _remoteGetAllCustomerInfoUseCase.execute();
        await resultRemote.fold(
                (failure) {
                  emit(CustomerInfoError(failure.message));
                },
                (data) async {
                  if (data.isNotEmpty) {
                    final deleteLocal = await _localDeleteAllCustomerInfoUseCase.execute();
                    await deleteLocal.fold(
                            (failure) {
                              emit(CustomerInfoError(failure.message));
                            },
                            (deleteSuccess) async {
                              for (var i in data) {
                                await _localInsertCustomerInfoUseCase.execute(
                                    CustomerInfoEntity(
                                      idCustomerInfo: i.idCustomerInfo,
                                      name: i.name,
                                      phone: i.phone,
                                    )
                                );
                              }
                              final getLocal = await _localGetAllCustomerInfoUseCase.execute();
                              getLocal.fold((failure) {
                                emit(CustomerInfoError(failure.message));
                              }, (successResult) {
                                emit(CustomerInfoSuccess(successResult));
                              });
                            }
                    );
                  }
          },
        );
      }
    });
  }

}