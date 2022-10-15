import 'package:db_offline_flutter/core/api_base_helper.dart';
import 'package:db_offline_flutter/core/dio_util.dart';
import 'package:db_offline_flutter/data/models/get_all_customer_info_model.dart';
import 'package:db_offline_flutter/injection.dart';
import 'package:dio/dio.dart';

abstract class RemoteCustomerInfoDataSource {
  Future<GetAllCustomerInfoModel> getAllCustomerInfo();
}

class RemoteCustomerInfoDataSourceImpl implements RemoteCustomerInfoDataSource {
  final APIBaseHelper helper = APIBaseHelper();
  late Dio dio = Dio();
  DioUtil dioUtil = locator<DioUtil>();

  RemoteCustomerInfoDataSourceImpl(this.dio) {
    dio = dioUtil.getInstance();
  }

  @override
  Future<GetAllCustomerInfoModel> getAllCustomerInfo() async {
    try {
      Response response = await dio.get(
          '${helper.baseUrl}v2/getAllCustomerInfo',
      );

      return GetAllCustomerInfoModel.fromJson(response.data);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }

}