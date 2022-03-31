import 'package:db_offline_flutter/model/customer_info_model.dart';
import 'package:db_offline_flutter/repository/customer_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_info_event.dart';
import 'customer_info_state.dart';

class CustomerInfoBloc extends Bloc<CustomerInfoEvent, CustomerInfoState> {
  final CustomerInfoRepository _customerInfoRepository;

  CustomerInfoBloc(this._customerInfoRepository) : super(CustomerInfoInitial());

  @override
  Stream<CustomerInfoState> mapEventToState(
      CustomerInfoEvent event,
      ) async* {
    if (event is CustomerInfo) {
      try {
        yield CustomerInfoLoading();
        final response = await _customerInfoRepository.getAllCustomerInfoAPI();
        await _customerInfoRepository.deleteAllCustomerInfo();
        response.data.forEach((v) async {
          await _customerInfoRepository.insertCustomerInfo(CustomerInfoModel.fromJson(v));
        });
        yield CustomerInfoSuccess(await _customerInfoRepository.getAllCustomerInfoDB());
      } catch (e) {
        yield CustomerInfoError(e.toString());
      }
    }
  }

}