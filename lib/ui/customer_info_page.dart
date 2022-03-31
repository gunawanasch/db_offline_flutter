import 'package:db_offline_flutter/bloc/customer_info/customer_info_bloc.dart';
import 'package:db_offline_flutter/bloc/customer_info/customer_info_event.dart';
import 'package:db_offline_flutter/bloc/customer_info/customer_info_state.dart';
import 'package:db_offline_flutter/model/customer_info_model.dart';
import 'package:db_offline_flutter/repository/customer_info_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({Key? key}) : super(key: key);

  @override
  State<CustomerInfoPage> createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  CustomerInfoBloc _customerInfoBloc = CustomerInfoBloc(CustomerInfoRepository());

  @override
  void initState() {
    _customerInfoBloc.add(CustomerInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Info"),
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<CustomerInfoBloc, CustomerInfoState>(
            bloc: _customerInfoBloc,
            builder: (context, state) {
              if (state is CustomerInfoInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CustomerInfoLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CustomerInfoSuccess) {
                if (state.listCustomerInfo.isNotEmpty) {
                  return ListView.builder(
                      itemCount: state.listCustomerInfo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomerInfoRow(customerInfoModel: state.listCustomerInfo[index]);
                      }
                  );
                } else {
                  return Center(child: Text("Data is empty"));
                }
              } else if (state is CustomerInfoError) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${state.message}")));
              }
              throw ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Error create widget")));
            },
          ),
        ),
      ),
    );
  }
}

class CustomerInfoRow extends StatelessWidget {
  CustomerInfoRow({Key? key, required this.customerInfoModel}) : super(key: key);
  final CustomerInfoModel customerInfoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerInfoModel.name!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        customerInfoModel.phone!,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}