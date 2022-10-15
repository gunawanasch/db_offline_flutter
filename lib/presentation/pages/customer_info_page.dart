import 'package:db_offline_flutter/domain/entities/customer_info_entity.dart';
import 'package:db_offline_flutter/presentation/blocs/customer_info/customer_info_bloc.dart';
import 'package:db_offline_flutter/presentation/blocs/customer_info/customer_info_event.dart';
import 'package:db_offline_flutter/presentation/blocs/customer_info/customer_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:db_offline_flutter/injection.dart';

class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({Key? key}) : super(key: key);

  @override
  State<CustomerInfoPage> createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  final CustomerInfoBloc _customerInfoBloc = locator<CustomerInfoBloc>();

  @override
  void initState() {
    _customerInfoBloc.add(CustomerInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Info"),
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<CustomerInfoBloc, CustomerInfoState>(
            bloc: _customerInfoBloc,
            builder: (context, state) {
              if (state is CustomerInfoInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CustomerInfoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CustomerInfoSuccess) {
                var listCustomerInfo = state.listCustomerInfo;
                if (listCustomerInfo.isNotEmpty) {
                  return ListView.builder(
                      itemCount: listCustomerInfo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomerInfoRow(customerInfo: listCustomerInfo[index]);
                      }
                  );
                } else {
                  return const Center(child: Text("Data is empty"));
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
  CustomerInfoRow({Key? key, required this.customerInfo}) : super(key: key);
  final CustomerInfoEntity customerInfo;

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
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerInfo.name!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        customerInfo.phone!,
                        style: const TextStyle(fontSize: 15),
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