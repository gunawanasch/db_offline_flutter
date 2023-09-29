import 'package:db_offline_flutter/model/customer_info_model.dart';
import 'package:db_offline_flutter/repository/customer_info_repository.dart';
import 'package:get/get.dart';

class CustomerInfoController extends GetxController {
  late CustomerInfoRepository customerInfoRepository = CustomerInfoRepository();
  List<CustomerInfoModel> listCustomerInfo = [];
  var isLoading = false.obs;
  var message = "";

  @override
  void onInit() {
    super.onInit();
    getAllCustomerInfo();
  }

  getAllCustomerInfo() async {
    isLoading.value = true;
    try {
      var result = await customerInfoRepository.getAllCustomerInfoAPI();
      await customerInfoRepository.deleteAllCustomerInfo();
      result.data.forEach((v) async {
        await customerInfoRepository.insertCustomerInfo(CustomerInfoModel.fromJson(v));
      });
      listCustomerInfo = await customerInfoRepository.getAllCustomerInfoDB();
      isLoading.value = false;
    } catch (e) {
      message = e.toString();
      isLoading.value = false;
    }
  }

}
